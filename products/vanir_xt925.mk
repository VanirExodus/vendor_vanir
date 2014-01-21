#Squisher Choosing
DHO_VENDOR := vanir

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true \
    ro.goo.rom=vanir-xt925

# Inherit AOSP device configuration for xt925.
$(call inherit-product, device/motorola/xt925/full_xt925.mk)

NO_DRM_BLOBS := true

# Inherit common Vanir files.
$(call inherit-product, vendor/vanir/products/beats.mk)
$(call inherit-product, vendor/vanir/products/gsm.mk)
$(call inherit-product, vendor/vanir/products/common_phones.mk)

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/vanir/proprietary/boot_animations/720x1280.zip:system/media/bootanimation.zip

# Setup device specific product configuration.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_BRAND=motorola PRODUCT_NAME=xt925 BUILD_PRODUCT=xt925 BUILD_FINGERPRINT=motorola/xt925/vanquish_u:4.4.2/7.7.1Q-144_VQL_S3-49/346380647:user/release-keys

PRODUCT_NAME := vanir_xt925
PRODUCT_DEVICE := xt925