#!/bin/bash

hub checkout ${BRANCH}
hub release create -a ./${APP_FOLDER}/build/outputs/apk/release/*-release.apk -m "Release - ${VERSION_NAME}" $(date +%Y%m%d%H%M%S)
