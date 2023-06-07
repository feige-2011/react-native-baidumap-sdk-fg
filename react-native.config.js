module.exports = {
  dependency: {
    platforms: {
      ios: { project: "lib/ios/react-native-baidumap-sdk-fg.podspec" },
      android: { sourceDir: "lib/android",
        packageImportPath:
            "import cn.qiuxiang.react.baidumap.BaiduMapPackage;",
        packageInstance: "new BaiduMapPackage()",}
    }
  },
  dependencies: {
    "react-native-baidumap-sdk-fg": {
      root: __dirname,
      platforms: {
        ios: { podspecPath: __dirname + "/lib/ios/react-native-baidumap-sdk-fg.podspec" },
      }
    }
  }
};
