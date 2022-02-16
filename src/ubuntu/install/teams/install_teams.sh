#!/usr/bin/env bash
set -ex
ARCH=$(arch | sed 's/aarch64/arm64/g' | sed 's/x86_64/amd64/g')

if [ "${ARCH}" == "arm64" ] ; then
    echo "Teams for arm64 currently not supported, skipping install"
    exit 0
fi

cd /tmp
# curl -L -o teams.deb  "https://go.microsoft.com/fwlink/p/?linkid=2112886&clcid=0x409&culture=en-us&country=us"
TEAMS_VERSION="teams_1.4.00.26453_amd64.deb"
curl -o $TEAMS_VERSION "https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/$TEAMS_VERSION"
apt-get install -y ./$TEAMS_VERSION
rm $TEAMS_VERSION
sed -i "s/Exec=teams/Exec=teams --no-sandbox/g" /usr/share/applications/teams.desktop
cp /usr/share/applications/teams.desktop $HOME/Desktop/
chmod +x $HOME/Desktop/teams.desktop
