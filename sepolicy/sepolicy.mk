#
# This policy configuration will be used by all products that
# inherit from CM
#

BOARD_SEPOLICY_DIRS += \
    vendor/vanir/sepolicy

BOARD_SEPOLICY_UNION += \
    mac_permissions.xml \
    seapp_contexts
