# Squisher Choosing
DHO_VENDOR := vanir

PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.rom=vanir-togari \
    drm.service.enabled=true

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/vanir/proprietary/boot_animations/1080x1920.zip:system/media/bootanimation.zip

# Inherit Vanir common Phone stuff.
$(call inherit-product, vendor/vanir/products/common_phones.mk)

#Go and build togari
$(call inherit-product, device/sony/togari/full_togari.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := togari
PRODUCT_NAME := vanir_togari
PRODUCT_BRAND := Sony
PRODUCT_MODEL := Xperia Z Ultra
PRODUCT_MANUFACTURER := Sony

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=C6833 BUILD_FINGERPRINT=Sony/C6833/C6833:5.0/14.4.A.0.133/k___jQ:user/release-keys PRIVATE_BUILD_DESC="C6833-user 5.0 14.4.A.0.133 k___jQ release-keys"
