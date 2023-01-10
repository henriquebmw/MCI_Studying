#!/bin/bash
USER=$1
if [ -z "$1" ]
then
    echo "No username given"
    exit 1
fi

read -r -p "Are you sure you want to delete the user ? [y/N] " response
response=${response,,}    # tolower
if [[ "$response" =~ ^(yes|y)$ ]]
then
    smbpasswd -x $USER
    userdel $USER
    mv /backups/$USER /backups/$USER.`date +"%Y%m%d%H%M%S"`.deleted
    rm /tmp/samba/smb.conf.d/$USER.conf

    ls /tmp/samba/smb.conf.d/* | sed -e 's/^/include = /' > /tmp/samba/includes.conf

    smbcontrol all reload-config
else
    echo "Nothing done"
fi