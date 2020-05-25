
### 利用GitHub Action 快速建立部署release和发布到蒲公英测试平台https://www.pgyer.com
### 注意
由于蒲公英测试平台都是国人用的 所以我就在这里备注一下，脚本是API 1.0 的 没有用API 2.0 </br>
详细参考这里https://www.pgyer.com/doc/view/api#uploadApp </br>
我建议你clone代码修改我的脚本然后去升级这块功能
### 操作例子
例子:
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
在这里可以拿到你的账号的Api https://www.pgyer.com/account/api



