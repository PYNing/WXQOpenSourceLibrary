
Pod::Spec.new do |s|
  #库名
  s.name         = "WXQOpenSourceLibrary"
  #库版本
  s.version      = "0.0.1"
  #库简短描述
  s.summary      = "creat a OpenSourceLibrary"
  #库详细描述(要比上面的简短描述长)
  s.description  = <<-DESC
      It introduces how to creat a OpenSourceLibrary
                   DESC

  #库介绍主页地址
  s.homepage     = "https://github.com/wuyukobe24/WXQOpenSourceLibrary"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  #库开源许可
  s.license      = { :type => "MIT", :file => "LICENSE" }
  #作者信息
  s.author             = { 'wuyukobe24' => 'jkwxq@sina.com' }
  # Or just: s.author    = "wuyukobe24"
  # s.authors            = { "wuyukobe24" => "jkwxq@sina.com" }

  # s.platform     = :ios
  # s.platform     = :ios, "5.0"
  #库依赖系统版本
  s.ios.deployment_target = "8.0"
  #源码git地址
  s.source       = { :git => "https://github.com/wuyukobe24/WXQOpenSourceLibrary.git", :tag => "#{s.version}" }
  #源码文件配置
  s.source_files  = 'WXQOpenSourceLibrary/Classes/*.{h,m}'
  # s.exclude_files = "Classes/Exclude"
  #源码头文件配置
  # s.public_header_files = "WXQOpenSourceLibrary/Classes/*."
  #资源文件配置
  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"
  #系统框架依赖
  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"
  #是否支持arc
  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
