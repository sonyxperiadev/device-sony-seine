# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Platform path
PLATFORM_COMMON_PATH := device/sony/seine

TRINKET := sm6125
SOMC_PLATFORM := seine
SOMC_KERNEL_VERSION := 4.19

PRODUCT_PLATFORM_SOD := true

TARGET_BOARD_PLATFORM := $(TRINKET)

SONY_ROOT := $(PLATFORM_COMMON_PATH)/rootdir

TARGET_PD_SERVICE_ENABLED := true

# Wi-Fi definitions for Qualcomm solution
WIFI_DRIVER_BUILT := qca_cld3
WIFI_DRIVER_DEFAULT := qca_cld3
BOARD_HAS_QCOM_WLAN := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
HOSTAPD_VERSION := VER_0_8_X
WIFI_DRIVER_FW_PATH_AP  := "ap"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X
TARGET_USES_ICNSS_QMI := true
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"

# BT definitions for Qualcomm solution
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
TARGET_USE_QTI_BT_STACK := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(PLATFORM_COMMON_PATH)/bluetooth
WCNSS_FILTER_USES_SIBS := true

# RIL
TARGET_PER_MGR_ENABLED := true

# NFC
NXP_CHIP_FW_TYPE := PN557

# Audio
AUDIO_FEATURE_ENABLED_AHAL_EXT := false
AUDIO_FEATURE_ENABLED_CONCURRENT_CAPTURE := true
AUDIO_FEATURE_ENABLED_DTS_EAGLE := false
AUDIO_FEATURE_ENABLED_DLKM := false
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := false
AUDIO_FEATURE_ENABLED_DYNAMIC_LOG := false
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_GKI := false
AUDIO_FEATURE_ENABLED_HW_ACCELERATED_EFFECTS := false
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_SSR := true
AUDIO_FEATURE_SONY_CIRRUS := true
BOARD_SUPPORTS_OPENSOURCE_STHAL := true
BOARD_SUPPORTS_QAHW := false
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true
TARGET_USES_QCOM_MM_AUDIO := true

# Display
TARGET_HAS_HDR_DISPLAY := true
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_USES_DRM_PP := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 2

# Lights HAL: Backlight
TARGET_USES_SDE := true

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(PLATFORM_COMMON_PATH)/overlay

# VPP
TARGET_DISABLE_QTI_VPP := true

# Force building a boot image.
# This needs to be set explicitly since Android R
PRODUCT_BUILD_BOOT_IMAGE := true

PRODUCT_USE_DYNAMIC_PARTITIONS := true

# A/B support
AB_OTA_UPDATER := true
PRODUCT_SHIPPING_API_LEVEL := 27

# A/B OTA dexopt package
PRODUCT_PACKAGES += \
    otapreopt_script

# A/B OTA dexopt update_engine hookup
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# A/B related packages
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_client \
    update_engine_sideload \
    update_verifier

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    product \
    vendor \
    vbmeta \
    vbmeta_system

# Dynamic Partitions: build fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Treble
# Include vndk/vndk-sp/ll-ndk modules
PRODUCT_PACKAGES += \
    vndk_package

# Audio
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(SONY_ROOT)/vendor/etc/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(SONY_ROOT)/vendor/etc/primary_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/primary_audio_policy_configuration.xml

# Media
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(SONY_ROOT)/vendor/etc/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(SONY_ROOT)/vendor/etc/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(SONY_ROOT)/vendor/etc/system_properties.xml:$(TARGET_COPY_OUT_VENDOR)/etc/system_properties.xml

# Qualcom WiFi Overlay
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(SONY_ROOT)/vendor/etc/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf

# Qualcom WiFi Configuration
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini

# NFC Configuration
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf

# Keylayout
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/usr/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# RQBalance-PowerHAL configuration
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/rqbalance_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/rqbalance_config.xml

# Platform specific init
PRODUCT_PACKAGES += \
    tad.rc \
    init.seine \
    init.seine.pwr \
    ueventd

# modemswitcher
PRODUCT_PACKAGES += \
    vendor.somc.hardware.modemswitcher@1.0-service.rc \
    init.sony-modem-switcher.rc

# CDSP init
PRODUCT_PACKAGES += \
    init.qcom.cdspstart.sh \
    cdsprpcd.rc

# HVDCP init
PRODUCT_PACKAGES += \
    hvdcp_opti.rc

# Audio init
PRODUCT_PACKAGES += \
    audiopd.rc

# Audio
PRODUCT_PACKAGES += \
    sound_trigger.primary.sm6125 \
    audio.primary.sm6125 \
    libcirrusspkrprot

# GFX
PRODUCT_PACKAGES += \
    copybit.sm6125 \
    gralloc.sm6125 \
    hwcomposer.sm6125 \
    memtrack.sm6125

# Keymaster 4 passthrough service init file
# (executable is on odm)
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.0-service-qti.rc \
    android.hardware.keymaster@4.1.vendor

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.keymaster.version=v4

DEVICE_MANIFEST_FILE += $(PLATFORM_COMMON_PATH)/vintf/android.hw.keymaster_v4.xml

# GPS
PRODUCT_PACKAGES += \
    gps.sm6125

# Sensors init
PRODUCT_PACKAGES += \
    adsp-sensorspdr.rc

# Sensors
# hardware.ssc.so links against display mappers, of which
# the interface libraries are explicitly included here:
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.1-service.multihal \
    vendor.qti.hardware.display.mapper@1.1.vendor \
    vendor.qti.hardware.display.mapper@3.0.vendor

# Sensors
PRODUCT_PACKAGES += \
    sns_reg_config \
    hals.conf

# CAMERA
PRODUCT_PACKAGES += \
    camera.sm6125

# QCOM Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.qcom.bluetooth.soc=cherokee

# Legacy BT property (will be removed in S)
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.qcom.bluetooth.soc=cherokee

# Audio - QCOM HAL
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio_hal.period_size=192 \
    persist.vendor.audio.ambisonic.capture=false \
    persist.vendor.audio.ambisonic.auto.profile=false \
    persist.vendor.audio.apptype.multirec.enabled=false \
    ro.vendor.audio.sdk.fluencetype=none \
    persist.vendor.audio.fluence.voicecall=true \
    persist.vendor.audio.fluence.voicerec=false \
    persist.vendor.audio.fluence.speaker=true \
    persist.vendor.audio.fluence.tmic.enabled=false \
    persist.vendor.audio.spv3.enable=true \
    persist.vendor.audio.avs.afe_api_version=2 \
    vendor.audio.tunnel.encode=false \
    persist.vendor.audio.ras.enabled=false \
    vendor.audio.offload.buffer.size.kb=32 \
    vendor.voice.path.for.pcm.voip=true \
    vendor.audio.dolby.ds2.enabled=false \
    vendor.audio.offload.multiple.enabled=false \
    vendor.audio.offload.passthrough=false \
    ro.vendor.audio.sdk.ssr=false \
    vendor.audio.offload.gapless.enabled=true \
    vendor.audio.safx.pbe.enabled=false \
    ro.bluetooth.a2dp_offload.supported=true \
    persist.bluetooth.a2dp_offload.disabled=false \
    vendor.audio.use.sw.alac.decoder=true \
    vendor.audio.use.sw.ape.decoder=true \
    vendor.audio_hal.in_period_size=144 \
    vendor.audio_hal.period_multiplier=3 \
    vendor.audio.volume.headset.gain.depcal=true \
    persist.vendor.audio.fluence.voicecomm=true \
    vendor.audio.hal.output.suspend.supported=true \
    persist.vendor.audio.voicecall.speaker.stereo=true \
    persist.vendor.bt.aac_frm_ctl.enabled=true \
    persist.vendor.bt.aac_vbr_frm_ctl.enabled=true

# Audio dynamic feature flags
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.feature.a2dp_offload.enable=true \
    vendor.audio.feature.afe_proxy.enable=true \
    vendor.audio.feature.anc_headset.enable=false \
    vendor.audio.feature.battery_listener.enable=true \
    vendor.audio.feature.compr_cap.enable=false \
    vendor.audio.feature.compress_in.enable=true \
    vendor.audio.feature.compress_meta_data.enable=true \
    vendor.audio.feature.compr_voip.enable=false \
    vendor.audio.feature.concurrent_capture.enable=true \
    vendor.audio.feature.custom_stereo.enable=true \
    vendor.audio.feature.display_port.enable=true \
    vendor.audio.feature.dsm_feedback.enable=false \
    vendor.audio.feature.dynamic_ecns.enable=true \
    vendor.audio.feature.ext_hw_plugin.enable=false \
    vendor.audio.feature.external_dsp.enable=false \
    vendor.audio.feature.external_speaker.enable=false \
    vendor.audio.feature.external_speaker_tfa.enable=false \
    vendor.audio.feature.fluence.enable=true \
    vendor.audio.feature.fm.enable=true \
    vendor.audio.feature.hdmi_edid.enable=true \
    vendor.audio.feature.hdmi_passthrough.enable=true \
    vendor.audio.feature.hfp.enable=true \
    vendor.audio.feature.hifi_audio.enable=false \
    vendor.audio.feature.hwdep_cal.enable=false \
    vendor.audio.feature.incall_music.enable=true \
    vendor.audio.feature.multi_voice_session.enable=true \
    vendor.audio.feature.keep_alive.enable=true \
    vendor.audio.feature.kpi_optimize.enable=true \
    vendor.audio.feature.maxx_audio.enable=false \
    vendor.audio.feature.ras.enable=true \
    vendor.audio.feature.record_play_concurency.enable=false \
    vendor.audio.feature.src_trkn.enable=true \
    vendor.audio.feature.spkr_prot.enable=true \
    vendor.audio.feature.ssrec.enable=true \
    vendor.audio.feature.usb_offload.enable=true \
    vendor.audio.feature.usb_offload_burst_mode.enable=true \
    vendor.audio.feature.usb_offload_sidetone_volume.enable=false \
    vendor.audio.feature.deepbuffer_as_primary.enable=false \
    vendor.audio.feature.vbat.enable=true \
    vendor.audio.feature.wsa.enable=false \
    vendor.audio.feature.audiozoom.enable=false \
    vendor.audio.feature.snd_mon.enable=true

# Audio - Sony specific
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.enable.cirrus.speaker=true

# Enable UBWC
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.gralloc.disable_ubwc=0

# SurfaceFlinger
# Keep in sync with NUM_FRAMEBUFFER_SURFACE_BUFFERS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=2

# USB controller setup
PRODUCT_PROPERTY_OVERRIDES += \
    sys.usb.controller=4e00000.dwc3 \
    sys.usb.rndis.func.name=gsi

#WiFi MAC address path
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.wifi.addr_path=/data/vendor/wifi/wlan_mac.bin

# DTBO partition definitions
TARGET_NEEDS_DTBOIMAGE ?= true

# IWLAN
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.iwlan_operation_mode=legacy

# Gatekeeper
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.gatekeeper.disable_spu=true

$(call inherit-product, device/sony/common/common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
