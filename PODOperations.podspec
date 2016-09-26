#
# Be sure to run `pod lib lint PODOperations.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'PODOperations'
    s.version          = '1.0.0'
    s.summary          = 'Simple Operation Base classes with error property.'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    Simple synchronous and asynchronous Operation Base classes with an error property.
    DESC
    
    s.homepage         = 'https://github.com/plaincode/PODOperations'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Peter Breitling' => 'pb@plaincode.com' }
    s.source           = { :git => 'https://github.com/plaincode/PODOperations.git', :tag => s.version.to_s }
    # s.social_media_url = 'https://twitter.com/plaincode'
    
    s.ios.deployment_target = '8.0'
    
    s.source_files = 'PODOperations/Classes/**/*'
    
    # s.resource_bundles = {
    #   'PODOperations' => ['PODOperations/Assets/*.png']
    # }
    
    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    # s.dependency 'AFNetworking', '~> 2.3'
end
