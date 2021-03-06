#!/bin/bash
# https://gist.github.com/FrankDeGroot/8cbec84eabfebcf2f2e7

echo "Finding latest kubectl"
# Returns $ARCH, which can be amd64, arm64 and ppc64le
. tools/get_arch.sh
# curl -s https://github.com/kubernetes/kubernetes/releases/latest  | awk -F '[<>]' '/.*/ { match($0, "tag/([^\"]+)",a); print a[1] }'
LATEST=$(wget -qO- https://github.com/kubernetes/kubernetes/releases/latest | awk -F '[<>]' '/href="\/kubernetes\/kubernetes\/tree\/.*"/ { match($0, "tree/([^\"]+)",a); print a[1] }' | head -1)

echo "Getting kubectl-$LATEST"
sudo wget -NP /usr/bin http://storage.googleapis.com/kubernetes-release/release/$LATEST/bin/linux/$ARCH/kubectl
sudo chmod 755 /usr/bin/kubectl
