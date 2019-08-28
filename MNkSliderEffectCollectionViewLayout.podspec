#
# Be sure to run `pod lib lint MNkSliderEffectCollectionViewLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MNkSliderEffectCollectionViewLayout'
  s.version          = '1.01'
  s.summary          = 'Custom Animator layout with horizontal slider'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'To this layout programmer can provide custom animator object and animate on slider perform. And also programmer can provide custom cell sttribute size and position to layout. And also can activate or deactivate paging base on cell not screen.'

  s.homepage         = 'https://github.com/mnkgitbox/MNkSliderEffectCollectionViewLayout'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mnkgitbox' => 'malith@azbow.com' }
  s.source           = { :git => 'https://github.com/mnkgitbox/MNkSliderEffectCollectionViewLayout.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'Classes/**/*'
  
  # s.resource_bundles = {
  #   'MNkSliderEffectCollectionViewLayout' => ['MNkSliderEffectCollectionViewLayout/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.swift_version = '4.0'
  # s.dependency 'AFNetworking', '~> 2.3'
end
