#!/bin/bash

hub checkout ${BRANCH}
VERSION_NAME=`grep -oP 'versionName "\K(.*?)(?=")' ./app/build.gradle`
hub release create -a ./app/build/outputs/apk/release/app-release/*-release.apk -m "Build# ${RELEASE_TITLE}" $(date +%Y%m%d%H%M%S)
