

Pod::Spec.new do |s|
  s.name             = 'LLBaseComponentLib'
  s.version          = '0.1.0'
  s.summary          = '这是一个超级超级屌的基础库,用了保证你能走上人生巅峰！！！'


  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/SAndL9/LLBaseComponentLib'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'SAndL9' => '1973204732@qq.com' }
  s.source           = { :git => 'https://github.com/SAndL9/LLBaseComponentLib.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

    s.source_files = "#{s.name}/Classes/**/*.{h,m}"

  # s.resource_bundles = {
  #   'LLBaseComponentLib' => ['LLBaseComponentLib/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
