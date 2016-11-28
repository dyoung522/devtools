# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "devtools/globals"

Gem::Specification.new do |spec|
  spec.name    = "ora-dev-tools"
  spec.version = DevTools::VERSION
  spec.authors = ["Donovan Young"]
  spec.email   = ["dyoung522@gmail.com"]

  spec.summary     = "Miscellaneous utilities to make a developers life easier"
  spec.description = "Utilities include:\n" +
                     "jdiff   - Compares two git branches and shows a diff of JIRA stories\n" +
                     "prlist  - Polls git repos and displays a queue of stories ready for QA\n" +
                     "runenv  - Run the dev environment based on local configuration\n" +
                     "runtest - Runs specs based on local configuration\n"
  spec.homepage    = "https://github.com/dyoung522/devtools"
  spec.license     = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "config", "~> 1.3"
  spec.add_dependency "octokit", "~> 4.0"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.4"
  spec.add_development_dependency "factory_girl", "~> 4.0"
end
