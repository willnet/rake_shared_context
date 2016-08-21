# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rake_shared_context/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["willnet"]
  gem.email         = ["netwillnet@gmail.com"]
  gem.description   = %q{shared_context for rake task}
  gem.summary       = %q{shared_context for rake task}
  gem.homepage      = "https://github.com/willnet/rake_shared_context"
  gem.license       = "MIT"
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rake_shared_context"
  gem.require_paths = ["lib"]
  gem.version       = RakeSharedContext::VERSION
  gem.add_development_dependency "rake"
  gem.add_development_dependency "appraisal"
end
