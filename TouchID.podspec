require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

# min cocoapods version 1.8.4
system("mkdir -p #{__dir__}/../../.temp")
zipfile = "#{__dir__}/../../.temp/#{package["name"]}.zip"
system("rm -rf #{zipfile} && zip -r #{zipfile} . > /dev/null")

Pod::Spec.new do |s|
  s.name         = "TouchID"
  s.version      = package['version']
  s.summary      = "A React Native library for authenticating users with Touch ID"
  s.homepage     = "https://github.com/naoufal/react-native-touch-id"
  s.license      = "MIT"
  s.author       = { "Naoufal Kadhom" => "naoufalkadhom@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source = { :http => "file://#{zipfile}"}
  s.source_files  = "*.{h,m}"
  s.dependency "React"
end
