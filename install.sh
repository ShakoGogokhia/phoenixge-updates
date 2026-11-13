#!/bin/sh
# Add the PhoenixGe update repository and install/upgrade phoenixge-desktop.
set -e
BASE=https://shakogogokhia.github.io/phoenixge-updates
[ "$(id -u)" = 0 ] || { echo "run with sudo"; exit 1; }
mkdir -p /usr/share/keyrings
curl -fsSL "$BASE/phoenixge-archive-keyring.gpg" -o /usr/share/keyrings/phoenixge-archive-keyring.gpg
cat > /etc/apt/sources.list.d/phoenixge.sources <<S
Types: deb
URIs: $BASE
Suites: stable
Components: main
Signed-By: /usr/share/keyrings/phoenixge-archive-keyring.gpg
S
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y phoenixge-desktop
echo "PhoenixGe updated - log out and back in to see the new look."
