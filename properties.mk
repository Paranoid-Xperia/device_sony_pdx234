# Bluetooth
PRODUCT_VENDOR_PROPERTIES += \
persist.sys.fflag.override.settings_bluetooth_hearing_aid=true \
persist.vendor.qcom.bluetooth.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac-aptxadaptiver2 \
persist.vendor.qcom.bluetooth.aac_frm_ctl.enabled=true \
persist.vendor.qcom.bluetooth.aac_vbr_ctl.enabled=true \
persist.vendor.qcom.bluetooth.aptxadaptiver2_1_support=true

# Camera
PRODUCT_VENDOR_PROPERTIES += \
ro.camera.enableCamera1MaxZsl=1 \
vendor.camera.enable.uvc=true \
vendor.mm.enable.qcom_parser=16777215

# Crypto
PRODUCT_VENDOR_PROPERTIES += \
ro.crypto.dm_default_key.options_format.version=2 \
ro.crypto.volume.metadata.method=dm-default-key

# Display
PRODUCT_ODM_PROPERTIES += \
persist.vendor.display.pcc_matrix=0.000000,0.000000,0.000000,0.000000,0.117647,0.235294 \
persist.vendor.colorgamut.mode=1 \
persist.vendor.display.colorgamut.mode=1 \
persist.vendor.display.sspp_color_mode=1 \
persist.vendor.display.opec_mode=0 \
vendor.display.hmd_mode=0 \
ro.surface_flinger.use_content_detection_for_refresh_rate=true \
ro.surface_flinger.set_display_power_timer_ms=1000 \
ro.surface_flinger.set_touch_timer_ms=200 \
ro.surface_flinger.set_idle_timer_ms=80 \

PRODUCT_VENDOR_PROPERTIES += \
ro.hardware.lights=sony \
persist.sys.sf.color_mode=9 \
persist.sys.sf.color_saturation=1.0 \
vendor.display.comp_mask=0 \
vendor.display.disable_3d_adaptive_tm=1 \
vendor.display.disable_excl_rect=0 \
vendor.display.disable_excl_rect_partial_fb=1 \
vendor.display.disable_offline_rotator=1 \
vendor.display.disable_scaler=0 \
vendor.display.disable_sdr_dimming=1 \
vendor.display.disable_sdr_histogram=1 \
vendor.display.disable_stc_dimming=1 \
vendor.display.enable_async_powermode=0 \
vendor.display.enable_async_vds_creation=1 \
vendor.display.enable_dpps_dynamic_fps=1 \
vendor.display.enable_early_wakeup=1 \
vendor.display.enable_optimize_refresh=0 \
vendor.display.vds_allow_hwc=1 \
vendor.display.disable_rounded_corner=1 \
vendor.display.enable_rc_support=1 \
vendor.gralloc.disable_ubwc=0 \
vendor.gralloc.enable_logs=0

# DPM
PRODUCT_VENDOR_PROPERTIES += \
persist.vendor.dpm.vndr.idletimer.mode=default \
persist.vendor.dpm.vndr.halservice.enable=1 \
persist.vendor.dpm.vndr.feature=11

# DRM
PRODUCT_VENDOR_PROPERTIES += \
drm.service.enabled=true

# FRP
PRODUCT_VENDOR_PROPERTIES += \
ro.frp.pst=/dev/block/bootdevice/by-name/frp

# Fuse
PRODUCT_VENDOR_PROPERTIES += \
persist.sys.fuse.passthrough.enable=true

# Gatekeeper
PRODUCT_VENDOR_PROPERTIES += \
vendor.gatekeeper.disable_spu=true

# Keystore
PRODUCT_VENDOR_PROPERTIES += \
ro.hardware.keystore_desede=true

# Media
PRODUCT_SYSTEM_PROPERTIES += \
media.aac_51_output_enabled=true \
media.settings.xml=/vendor/etc/media_profiles_kalama.xml \
ro.media.recorder-max-base-layer-fps=60

PRODUCT_VENDOR_PROPERTIES += \
media.stagefright.enable-aac=true \
media.stagefright.enable-fma2dp=true \
media.stagefright.enable-http=true \
media.stagefright.enable-player=true \
media.stagefright.enable-qcp=true \
media.stagefright.enable-scan=true \
media.stagefright.thumbnail.prefer_hw_codecs=true \
ro.mediaserver.64b.enable=true

# NFC
PRODUCT_SYSTEM_PROPERTIES += \
ro.camera.notify_nfc=1

# Renderer
PRODUCT_SYSTEM_PROPERTIES += \
debug.hwui.renderer=skiavk