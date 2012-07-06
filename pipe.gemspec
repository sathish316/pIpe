# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "pipe/version"

Gem::Specification.new do |s|
  s.name        = "pipe"
  s.version     = Pipe::VERSION
  s.authors     = ["Sathish"]
  s.email       = ["sathish316@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{pIpe is ifttt for websites/webservices linked to webservices/smartphones/laptops with sophisticated filters}
  s.description = %q{pIpe is ifttt for websites/webservices linked to webservices/smartphones/laptops with sophisticated filters. pIpe is like *nix pipe operator for linking websites, webservices, smartphones and laptops}

  s.rubyforge_project = "pipe"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
