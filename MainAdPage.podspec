#
#  Be sure to run `pod spec lint MainAdPage.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "MainAdPage"
  
  s.version      = "1.0.0"
  
  s.summary      = "A mainAdPage used on iOS"

  s.description  = <<-DESC
                  It is a MainAdPage view used on iOS, which implement by Objective-C.
                   DESC

  s.homepage     = "https://github.com/asphg/MainAdPage"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "CentanetAPP" => "sujp01@centaline.com.cn" }

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/asphg/MainAdPage", :tag => "#{s.version}" }

  s.source_files = "MainAdPageSourceCode/*"

  s.frameworks   = "Foundation", "UIKit"

  s.requires_arc = true

end
