#!/bin/bash

hub checkout ${BRANCH}
hub release create -a ./${APP_FOLDER}/build/outputs/apk/release/*-release.apk -m "Release - ${VERSION_NAME}" $(date +%Y%m%d%H%M%S)
local='./app/build/outputs/apk/release/*-release.apk'
echo $local
curl -F "file=@${local}" \
        -F "uKey=${uKey}" \
        -F "_api_key=${apiKey}" \
        https://www.pgyer.com/apiv1/app/upload
