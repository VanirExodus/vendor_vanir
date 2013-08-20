#Squisher Choosing
DHO_VENDOR := vanir

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true \
    ro.goo.rom=vanir-T889

# place boot animation here once we make one
# PRODUCT_COPY_FILES += \
#    vendor/vanir/proprietary/mako/media/bootanimation.zip:system/media/bootanimation.zip

# Vanir configuration
$(call inherit-product, vendor/vanir/products/common_phones.mk)
# $(call inherit-product, vendor/vanir/products/beats.mk)

# GSM APNs and Simcard app
$(call inherit-product, vendor/vanir/products/gsm.mk)

# Inherit AOSP device configuration for Note 2.
$(call inherit-product, device/samsung/t0ltetmo/full_t0ltetmo.mk)

#... and then make the AOSP device configuration for i605 get on its knees and sing the national anthem into our "microphones"
PRODUCT_LOCALES := en_US

# Setup device specific product configuration.
PRODUCT_NAME := vanir_t0ltetmo
PRODUCT_DEVICE := t0ltetmo
PRODUCT_BRAND := Samsung
PRODUCT_MANUFACTURER := Samsung
PRODUCT_MODEL := SCH-T889

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=t0ltetmo BUILD_FINGERPRINT="samsung/t0ltetmo/t0ltetmo:4.3/JSS15J/737497:user/release-keys" PRIVATE_BUILD_DESC="t0ltetmo-user 4.3 JSS15J 737497 release-keys"