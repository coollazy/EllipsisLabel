Pod::Spec.new do |s|
  s.name          = "EllipsisLabel"
  s.version       = "1.0.0"
  s.swift_version = "5.0.0"
  s.summary       = "EllipsisLabel"
  s.description   = <<-DESC
                     EllipsisLabel is a label with custom ellipsis.
                     DESC

  s.homepage      = "https://github.com/coollazy/EllipsisLabel.git"
  s.license       = "MIT"
  s.author        = { "ven.wu" => "ven.wu.github@gamil.com" }
  s.platform      = :ios, "10.0"
  s.source        = { :git => "https://github.com/coollazy/EllipsisLabel.git", :tag => s.version }
  s.source_files  = "Sources/EllipsisLabel/**/*.{swift}"
end
