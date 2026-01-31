## TODO: Pass the SSID and password through env vars to avoid hardcoding before pushing to remote
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://hostapd.conf"

do_install:append() {
    install -d ${D}${sysconfdir}/hostapd
    install -m 0600 ${WORKDIR}/hostapd.conf \
        ${D}${sysconfdir}/hostapd/hostapd.conf
}