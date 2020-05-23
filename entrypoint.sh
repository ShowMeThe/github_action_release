#!/bin/bash

hub checkout ${BRANCH}
VERSION_NAME=`grep -oP 'versionName "\K(.*?)(?=")' ./app/build.gradle`
hub release create -a ./app/release/outputs/apk/*-release.apk -m "${RELEASE_TITLE} - v${VERSION_NAME}" $(date +%Y%m%d%H%M%S) 