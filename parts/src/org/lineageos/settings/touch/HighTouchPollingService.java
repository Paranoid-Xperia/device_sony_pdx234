/*
 * Copyright (C) 2023 Paranoid Android
 *
 * SPDX-License-Identifier: Apache-2.0
 */
package org.lineageos.settings.touch;

import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.ContentObserver;
import android.os.Handler;
import android.os.IBinder;
import android.os.PowerManager;
import android.os.UserHandle;
import android.provider.Settings;
import android.util.Log;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class HighTouchPollingService extends Service {

    private static final String TAG = "HighTouchPollingService";
    private static final boolean DEBUG = true;

    private static final String SETTING_KEY = "touch_polling_enabled";
    private static final String TS_NODE = "/sys/devices/virtual/input/lxs_ts_input/frame_rate_np";

    private boolean mEnabled;
    private boolean mScreenOn = true;
    private PowerManager mPowerManager;
    private boolean isPowerSaveCached = false; // Cache power save state
    private BufferedWriter touchNodeWriter = null; // Pre-open the file writer

    private final ContentObserver mSettingObserver = new ContentObserver(new Handler()) {
        @Override
        public void onChange(boolean selfChange) {
            updateTouchPollingState(true); // Update the state
        }
    };

    private final BroadcastReceiver mIntentReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            switch (intent.getAction()) {
                case Intent.ACTION_SCREEN_ON:
                    mScreenOn = true;
                    updateTouchPollingState(false); // Update when screen turns on
                    break;
                case Intent.ACTION_SCREEN_OFF:
                    mScreenOn = false;
                    updateTouchPollingState(false); // Update when screen turns off
                    break;
                case PowerManager.ACTION_POWER_SAVE_MODE_CHANGED:
                    isPowerSaveCached = mPowerManager.isPowerSaveMode();
                    updateTouchPollingState(false); 
                    break;
            }
        }
    };

    @Override
    public void onCreate() {
        super.onCreate();
        mPowerManager = getSystemService(PowerManager.class); 
        getContentResolver().registerContentObserver(Settings.Secure.getUriFor(SETTING_KEY),
                false, mSettingObserver);
        IntentFilter filter = new IntentFilter(Intent.ACTION_SCREEN_ON);
        filter.addAction(Intent.ACTION_SCREEN_OFF);
        filter.addAction(PowerManager.ACTION_POWER_SAVE_MODE_CHANGED);
        registerReceiver(mIntentReceiver, filter);

        // Initialize power save state and open file writer
        isPowerSaveCached = mPowerManager.isPowerSaveMode();
        try {
            touchNodeWriter = new BufferedWriter(new FileWriter(TS_NODE)); 
        } catch (IOException e) {
            Log.e(TAG, "Error opening touch node for writing", e);
        }

        updateTouchPollingState(true); // Initial update
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        dlog("onStartCommand");
        return START_STICKY;
    }

    @Override
    public void onDestroy() {
        getContentResolver().unregisterContentObserver(mSettingObserver);
        unregisterReceiver(mIntentReceiver);

        // Close the file writer
        if (touchNodeWriter != null) {
            try {
                touchNodeWriter.close();
            } catch (IOException e) {
               // Handle error
            }
        }

        super.onDestroy();
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    public static void startService(Context context) {
        context.startServiceAsUser(new Intent(context, HighTouchPollingService.class),
                UserHandle.CURRENT);
    }

    private void updateTouchPollingState(boolean readSetting) {
        if (readSetting) {
            mEnabled = Settings.Secure.getInt(getContentResolver(), SETTING_KEY, 0) == 1;
        }

        if (touchNodeWriter != null) { // Ensure file writer is open
            try {
                // Dynamically determine value to write
                String valueToWrite = mScreenOn && mEnabled && !isPowerSaveCached ? "0 3" : "0 2";
                touchNodeWriter.write(valueToWrite);
                touchNodeWriter.flush();
            } catch (IOException e) {
                Log.e(TAG, "Error writing to touch node", e);
            }
        }
    }
    
    private static void dlog(String msg) {
        if (DEBUG) Log.d(TAG, msg);
    }
}
