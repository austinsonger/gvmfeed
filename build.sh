#!/usr/bin/env bash

set -e

cd ./build

# default - vars
[ -z "${BUILD}" ] && BUILD=""

# build gvm-feed-server
echo "
################################################################################
################### Build gvm-feed ##############################################
################################################################################"
gvmfeed_version=2.1
build_gvmfeed=""
docker build -f ./Dockerfile \
  -t "darkthirtysecurity/gvmfeed:${gvmfeed_version}${build_gvmfeed:-${BUILD}}" \
  -t "darkthirtysecurity/gvmfeed:latest" .

# push
if [ "${1}" == "push" ]; then
  docker push "darkthirtysecurity/gvmfeed:${gvm_feed_server_version}${build_gvm_feed_server:-${BUILD}}"
  docker push "darkthirtysecurity/gvmfeed:latest"
fi
