# -*- encoding: utf-8 -*-
require File.expand_path('../lib/directions/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Christian Frugard"]
  gem.email         = ["frugardc@gmail.com"]
  gem.description   = %q{Gem for Google Directions API}
  gem.summary       = %q{Wraps the Google Directions api.  Adds some methods to easily return results, as well as dot notation access to the results hash}
  gem.homepage      = "http://github.com/frugardc/directions"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "directions"
  gem.require_paths = ["lib"]
  gem.version       = Directions::VERSION
  gem.add_dependency "system_timer"
  gem.add_dependency "faraday"
  gem.add_dependency "json"
end
