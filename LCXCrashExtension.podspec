Pod::Spec.new do |s|
  s.name             = "LCXCashExtension"
  s.version          = "1.0.0"
  s.summary          = "LCXCashExtension protect your code" 
  s.description      = <<-DESC
                       LCXCashExtension is the last defender of your code, protect your code to crash.
                       DESC
  s.homepage         = "https://github.com/dudongdaoqi/LCXCashExtension"
  s.license          = 'MIT'
  s.author           = { "xulicheng" => "dudongdaoqi@gmail.com" }
  s.source           = { :git => "https://github.com/dudongdaoqi/LCXCashExtension.git", :tag => "1.0.0" }
  s.platform     = :iOS, '8.0'
  s.requires_arc = true
  s.source_files = 'LCXCashExtension/*'
  s.frameworks = 'Foundation', 'objc'  
end