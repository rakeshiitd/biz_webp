$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "biz_webp/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "biz_webp"
  s.version     = BizWebp::VERSION
  s.authors     = ["Rakesh Yadav"]
  s.email       = ["rakesh.yadav@limetray.com"]
  s.homepage    = "http://www.bizongo.in"
  s.summary     = "Summary of BizWebp."
  s.description = "Description of BizWebp."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"
  s.add_dependency 'webp-ffi'
  s.add_dependency 'carrierwave'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'bundler', '~> 1.3'
  s.add_development_dependency 'rake'
end
