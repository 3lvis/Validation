Pod::Spec.new do |s|
  s.name             = "Validation"
  s.summary          = "Validations for min/max value, min/max length, regex and so on"
  s.version          = "0.3.1"
  s.homepage         = "https://github.com/3lvis/Validation"
  s.license          = 'MIT'
  s.author           = { "Elvis Nuñez" => "elvisnunez@me.com" }
  s.source           = { :git => "https://github.com/3lvis/Validation.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/3lvis'
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'Source/**/*'
  s.frameworks = 'Foundation'
end
