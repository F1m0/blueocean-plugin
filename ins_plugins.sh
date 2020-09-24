#!/bin/sh

echo "copy plugins"
cp  blueocean/target/plugins/* /usr/share/jenkins/ref/plugins/   ;
echo "rename to jpi"
for f in /usr/share/jenkins/ref/plugins/*.hpi; do mv "$f" "${f%%hpi}jpi"; done;
echo "install plugins"
install-plugins.sh antisamy-markup-formatter matrix-auth;
echo "override"
for f in /usr/share/jenkins/ref/plugins/blueocean-*.jpi; do mv "$f" "$f.override"; done;
