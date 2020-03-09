lane :build_pods do
  xcodebuild(
    :project => File.expand_path('../Pods/Pods.xcodeproj'),
    :scheme => 'Pods',
    :configuration => 'Release',
    :destination => 'generic/platform=iOS'
  )
end

lane :build_app do
  cache_folder = File.expand_path('../build/Release-iphoneos')
  gym(
    project: 'App.xcodeproj',
    scheme: 'App',
    configuration: 'Release',
    destination: 'generic/platform=iOS',
    xcargs: [
      "PODS_CONFIGURATION_BUILD_DIR=#{cache_folder}",
      "FRAMEWORK_SEARCH_PATHS='$(inherited) #{cache_folder}'"
    ].join(" ")
  )
end