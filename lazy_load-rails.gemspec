$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "lazy_load/rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "lazy_load-rails"
  s.version     = LazyLoad::Rails::VERSION
  s.authors     = ["Jignesh Satam"]
  s.email       = ["jigneshsatam@gmail.com"]
  s.homepage    = "https://github.com/JigneshSatam/lazy_load-rails"
  s.summary     = "LazyLoadingPage loads heay pages lazily as and when required."
  s.description = "LazyLoadingPage loads heay pages lazily as and when required. Single heavy request is broken in small requests, so no timeouts and no congestion of requests. The gem reduces page load time and reduces server ram by loading important content of the page in the first call and then by triggering calls to load the remaining page. The gem gives Reactjs like functionality in your ruby-on-rails application."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"

  # s.add_development_dependency "sqlite3"
end
