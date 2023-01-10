#!/bin/bash
USER=$1
if [ -z "$1" ]
then
    echo "No username given"
    exit 1
fi

#Create user
useradd -M -d /backups/$USER -s /usr/sbin/nologin -G sambashare $USER
mkdir /backups/$USER
chown $USER:sambashare /backups/$USER
chmod 2770 /backups/$USER
smbpasswd -a $USER
smbpasswd -e $USER

cat  /tmp/samba/smb.conf.d/$USER.conf
[$USER]
    path = /backups/$USER
    browseable = no
    read only = no
    force create mode = 0660
    force directory mode = 2770
    valid users = $USER @sadmin
EOF

ls /etc/samba/smb.conf.d/* | sed -e 's/^/include = /' > /tmp/samba/includes.conf

smbcontrol all reload-config