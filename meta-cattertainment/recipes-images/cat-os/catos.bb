SUMMARY = "Custom Image for Cattertainment System"
LICENSE = "MIT"

inherit core-image

IMAGE_INSTALL:append = "\
      hostapd \
      dnsmasq \
      iw \
      wireless-regdb-static \
    "