#!/bin/bash
#
# Entrypoint for apcupsd container.
#
set -ex

ENVVAR_PREFIX="APCUPSD_"
SETTINGS=(
    UPSNAME UPSCABLE UPSTYPE DEVICE POLLTIME LOCKFILE SCRIPTDIR PWRFAILDIR
    NOLOGINDIR ONBATTERYDELAY BATTERYLEVEL MINUTES TIMEOUT ANNOY ANNOYDELAY
    NOLOGON KILLDELAY NETSERVER NISIP NISPORT EVENTSFILE EVENTSFILEMAX UPSCLASS
    UPSMODE STATTIME STATFILE LOGSTATS DATATIME FACILITY
)

for s in "${SETTINGS[@]}"; do
    name="${ENVVAR_PREFIX}${s}"
    value="${!name}"
    if [[ "x${value}" != "x" ]]; then
        echo "Setting $s=$value"
        sed -i -r "s/^(#)?$s .*\$/$s $value/g" /etc/apcupsd/apcupsd.conf
    fi
done

apcupsd -b
