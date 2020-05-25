### A Example to build a releas apk by Github Action 

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
