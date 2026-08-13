Pod::Spec.new do |s|
  s.name = 'UXCamSwiftUI'
  s.version = '3.10.1'

  s.summary = "UXCam SwiftUI wrapper SDK for iOS applications"
  s.description = <<-DESC
                  Visit https://uxcam.com to get a key.
                  This is version #{s.version} of the SDK - see CHANGELOG for details
                  DESC
  s.homepage = "https://uxcam.com/"
  s.license = { :type => 'BSD' }

  s.author = { 'UXCam' => 'admin@uxcam.com' }
  s.social_media_url = "https://www.twitter.com/uxcam"
  s.documentation_url = 'https://developer.uxcam.com/docs/swiftui-ios'

  s.platform = :ios, 13.0

  # UXCam 1.10.0 is already published on CocoaPods with this immutable source.
  # Release staging switches future versions to the new Release asset URL.
  s.source = { :http => "https://github.com/uxcam/uxcam-swiftui/releases/download/3.10.1/UXCamSwiftUI.xcframework.zip" }
  s.vendored_frameworks = 'UXCamSwiftUI.xcframework'

  s.static_framework = true
  s.requires_arc = true


  s.dependency 'UXCam', '3.10.0'
  s.swift_version = '5.0'



end
