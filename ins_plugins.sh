#!/bin/sh

cp -r blueocean/target/plugins /usr/share/jenkins/ref/plugins/   ;
for f in /usr/share/jenkins/ref/plugins/*.hpi; do mv "$f" "${f%%hpi}jpi"; done;
install-plugins.sh antisamy-markup-formatter matrix-auth;
for f in /usr/share/jenkins/ref/plugins/blueocean-*.jpi; do mv "$f" "$f.override"; done;
