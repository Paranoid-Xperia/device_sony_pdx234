# Audio
PRODUCT_VENDOR_PROPERTIES += \
vendor.audio.feature.custom_stereo.enable=true \
vendor.audio.feature.display_port.enable=true \
vendor.audio.feature.hdmi_edid.enable=true \
vendor.audio.feature.hdmi_passthrough.enable=true \
vendor.audio.enable.cirrus.speaker=true

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
ro.surface_flinger.set_touch_timer_ms=4000 \
ro.surface_flinger.set_idle_timer_ms=40 \

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

PRODUCT_SYSTEM_PROPERTIES += \
debug.sf.auto_latch_unsignaled=1

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
PRODUCT_PRODUCT_PROPERTIES += \
persist.sys.fuse.passthrough.enable=true

# Graphics
PRODUCT_VENDOR_PROPERTIES += \
ro.surface_flinger.force_hwc_copy_for_virtual_displays=true \
ro.surface_flinger.has_HDR_display=true \
ro.surface_flinger.has_wide_color_display=true \
ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
ro.surface_flinger.max_virtual_display_dimension=4096 \
ro.surface_flinger.protected_contents=true \
ro.surface_flinger.use_content_detection_for_refresh_rate=true \
ro.surface_flinger.use_color_management=true \
ro.surface_flinger.wcg_composition_dataspace=143261696

# Gatekeeper
PRODUCT_VENDOR_PROPERTIES += \
vendor.gatekeeper.disable_spu=true

# Keystore
PRODUCT_VENDOR_PROPERTIES += \
ro.hardware.keystore_desede=true

# Media
PRODUCT_SYSTEM_PROPERTIES += \
media.aac_51_output_enabled=true \
ro.media.recorder-max-base-layer-fps=60

PRODUCT_PRODUCT_PROPERTIES += \
media.settings.xml=/vendor/etc/media_profiles_kalama.xml

PRODUCT_VENDOR_PROPERTIES += \
debug.stagefright.c2inputsurface=-1 \
media.stagefright.enable-aac=true \
media.stagefright.enable-fma2dp=true \
media.stagefright.enable-http=true \
media.stagefright.enable-player=true \
media.stagefright.enable-qcp=true \
media.stagefright.enable-scan=true \
media.stagefright.thumbnail.prefer_hw_codecs=true \
ro.mediaserver.64b.enable=true \
vendor.media.omx=0

# NFC
PRODUCT_SYSTEM_PROPERTIES += \
ro.camera.notify_nfc=1

# IMS
PRODUCT_SYSTEM_PROPERTIES += \
persist.vendor.ims.disableADBLogs=1 \
persist.vendor.ims.disableDebugLogs=1 \
persist.vendor.ims.disableIMSLogs=1 \
persist.vendor.ims.disableQXDMLogs=1

# Sony Wifi-6E props
PRODUCT_VENDOR_PROPERTIES += \
ro.vendor.product.rf.id=pdx234-A4 \
ro.vendor.sony.wlan.6e_cc_list=AT,BE,BG,HR,CY,CZ,DK,EE,FI,FR,DE,GR,HU,IE,IT,LV,LI,LT,LU,MT,NL,NO,PL,PT,RO,SK,SI,ES,SE,GB,CH \
ro.oem_ant_switch_index_table=10,12,12,12,10,12,12,12,12,12,12,12,12,12,12,12,10,12,12,12,10,12,12,12,12,12,12,12,12,12,12,12,10,12,12,12,10,12,12,12,12,12,12,12,12,12,12,12,10,12,12,12,10,12,12,12,12,12,12,12,12,12,12,12 \
ro.oem_sar_back_off_index_table=1,3,8,1,6,3,8,1,5,3,8,1,5,3,8,1,1,3,8,1,6,3,8,1,5,3,8,1,5,3,8,1

# Renderer
PRODUCT_SYSTEM_PROPERTIES += \
debug.hwui.renderer=skiavk

PRODUCT_VENDOR_PROPERTIES += \
debug.renderengine.backend=skiavkthreaded

# Sony Wifi-6E props
PRODUCT_VENDOR_PROPERTIES += \
ro.vendor.product.rf.id=pdx234-A4 \
ro.vendor.sony.wlan.6e_cc_list=AT,BE,BG,HR,CY,CZ,DK,EE,FI,FR,DE,GR,HU,IE,IT,LV,LI,LT,LU,MT,NL,NO,PL,PT,RO,SK,SI,ES,SE,G>ro.oem_ant_switch_index_table=10,12,12,12,10,12,12,12,12,12,12,12,12,12,12,12,10,12,12,12,10,12,12,12,12,12,12,12,12,12>ro.oem_sar_back_off_index_table=1,3,8,1,6,3,8,1,5,3,8,1,5,3,8,1,1,3,8,1,6,3,8,1,5,3,8,1,5,3,8,1
