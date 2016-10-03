Pod::Spec.new do |s|
s.name                    = "Conductor"
s.version                 = "0.100.1.1"
s.summary                 = "A framework for displaying an 'on-boarding' UI"

s.homepage                = "https://github.com/exsortis/Conductor"
s.license                 = { :type => 'MIT', :file => 'LICENSE' }
s.author                  = { "Paul Schifferer" => "paul@schifferers.net" }

s.source                  = { :git => "https://github.com/exsortis/Conductor.git", :tag => s.version.to_s }
s.source_files            = 'Conductor/*.swift'
s.resources               = ['Conductor/**/*.storyboard', 'Conductor/**/*.xcassets', 'Conductor/**/*.strings']
s.frameworks              = 'UIKit'
s.compiler_flags          = '-DSWIFT_VERSION=3.0'
s.pod_target_xcconfig     = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
                              'SWIFT_VERSION' => '3.0' }
s.user_target_xcconfig    = { 'SWIFT_VERSION' => '3.0' }
s.ios.deployment_target   = '9.3'
s.requires_arc            = true
end
