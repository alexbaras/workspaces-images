#!/usr/bin/env bash
set -ex
ARCH=$(arch | sed 's/aarch64/arm64/g' | sed 's/x86_64/x64/g')

cd /tmp
VSCODE_VERSION="code_1.64.2-1644445741_amd64.deb"
curl -L -o $VSCODE_VERSION "https://packages.microsoft.com/repos/vscode/pool/main/c/code/$VSCODE_VERSION"
apt-get install -y ./$VSCODE_VERSION
sed -i 's#/usr/share/code/code#/usr/share/code/code --no-sandbox##' /usr/share/applications/code.desktop
cp /usr/share/applications/code.desktop $HOME/Desktop
chmod +x $HOME/Desktop/code.desktop
chown 1000:1000 $HOME/Desktop/code.desktop
rm $VSCODE_VERSION
