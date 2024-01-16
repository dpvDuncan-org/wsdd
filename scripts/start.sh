#!/bin/sh
CONFIG_FILE="/config/smb.conf"

SMB_GROUP=$(grep -i '^\s*workgroup\s*=' ${CONFIG_FILE} | cut -f2 -d= | tr -d '[:blank:]')
HOST_NAME=$(grep -i '^\s*server string\s*=' ${CONFIG_FILE} | cut -f2 -d= | tr -d '[:blank:]')
wsdd -w ${SMB_GROUP} -n ${HOST_NAME} | tee /config/wsdd.log