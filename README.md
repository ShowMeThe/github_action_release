### A Example to build a release apk by Github Action
### ReadMe:
[中文ReadMe](https://github.com/ShowMeThe/github_action_release/blob/master/README_zh.md)
### Warning:
https://www.pgyer.com is a platform to release the apk for testing member,so if you don't need this fuction,I suggest you clone the code and delete the following code in the entrypoint.sh
```
var="./${APP_FOLDER}/build/outputs/apk/release/*-release.apk"
local="$(find  -wholename $var)"
echo $local
curl -F "file=@$local" \
        -F "uKey=${uKey}" \
        -F "_api_key=${apiKey}" \
        https://www.pgyer.com/apiv1/app/upload
```
Remember add the code in your ./app/build.gradle
```
buildTypes{
    release {
       signingConfig signingConfigs.release
    }
}
```
Example:
```

name: Build Apk

on:
  push:
    branches: [ master ]

jobs:

  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: set up JDK 1.8
      uses: actions/setup-java@v1
      with:
        java-version: 1.8
    - name: Make Gradle executable
      run: chmod +x ./gradlew
    - name: Build with Gradle
      run: ./gradlew build
    - name: Build Release APK
      run: ./gradlew assembleRelease
    - name: Releasing using Hub And 
      uses: ShowMeThe/github_action_release@master
      env:
       GITHUB_TOKEN: Your GITHUB_TOKEN
       APP_FOLDER: app
       BRANCH: master
       VERSION_NAME: v1.0
       uKey: your pgyer key 
       apiKey: your pgyer apiKey

```
Check your own pgyer key on https://www.pgyer.com/account/api
