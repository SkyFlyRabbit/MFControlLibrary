#
# Be sure to run `pod lib lint MFControlLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MFControlLibrary'
  s.version          = '0.1.0'
  s.summary          = '该控件库为日常所常用工具类集合,使用便捷'

  s.description      = <<-DESC
            库文件主要有一下几类功能:
            1.宏定义类:提供常用的宏定义(如数字比较,判断等)
            2.常用类类目:提供常用的分类方法(如日期转,富文本等)
            3.常用工具类:提供各种常用的小工具(如弹窗等)
                       DESC

  s.homepage         = 'https://github.com/953950782@qq.com/MFControlLibrary'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mf' => 'weekendlittleant@126.com' }
  s.source           = { :git => 'https://github.com/953950782@qq.com/MFControlLibrary.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.frameworks = 'UIKit', 'Foundation'

  s.source_files = 'MFControlLibrary/**/*.{h,m}'
  
  # s.resource_bundles = {
  #   'MFControlLibrary' => ['MFControlLibrary/Assets/*.png']
  # }

  s.public_header_files = 'MFControlLibrary/**/*.h'

  #s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
end
