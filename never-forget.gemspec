# encoding: utf-8

Gem::Specification.new do |gem|
  gem.name    = 'never-forget'
  gem.version = '0.1.2'
  
  gem.add_dependency 'mingo', '>= 0.2'
  gem.add_dependency 'activesupport'
  gem.add_dependency 'rack'
  gem.add_dependency 'erubis'
  
  gem.summary = "Saves exceptions to MongoDB"
  gem.description = "Never Forget is a layer of persistence for exceptions thrown in a Rack application at runtime."
  
  gem.authors  = ['Mislav Marohnić']
  gem.email    = 'mislav.marohnic@gmail.com'
  gem.homepage = 'https://github.com/mislav/never-forget'
  
  gem.files = Dir['Rakefile', '{bin,lib,test,spec}/**/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")
end
