#Squisher Choosing
DHO_VENDOR := vanir

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true \
    ro.goo.rom=vanir-n5120

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/vanir/proprietary/boot_animations/720x1280.zip:system/media/bootanimation.zip

# Inherit device configuration
$(call inherit-product, device/samsung/n5120/full_n5120.mk)

# Inherit common bacon files.
$(call inherit-product, vendor/vanir/products/common_phones.mk)
$(call inherit-product, vendor/vanir/products/gsm.mk)

# Inherit VANIR overlays.
    PRODUCT_PACKAGE_OVERLAYS += vendor/vanir/overlay/tab_radio

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := n5120
PRODUCT_NAME := vanir_n5120
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-N5120
PRODUCT_MANUFACTURER := samsung

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-N5120 TARGET_DEVICE=GT-N5120 BUILD_FINGERPRINT="samsung/konaltexx/konalte:4.2.2/JDQ39/N5120XXCMI1:user/release-keys" PRIVATE_BUILD_DESC="konaltexx-user 4.2.2 JDQ39 N5120XXCMI1 release-keys"