# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sidekiq/notifier/version'

Gem::Specification.new do |spec|
  spec.name          = "sidekiq-notifier"
  spec.version       = Sidekiq::Notifier::VERSION
  spec.authors       = ["Zidni Mubarock"]
  spec.email         = ["zidmubarock@gmail.com"]
  spec.description   = %q{don't ever miss any exception and notify it directly to your inbox}
  spec.summary       = %q{don't ever miss any exception and notify it directly to your inbox}
  spec.homepage      = "https://github.com/barock19/sidekiq-notifier"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_dependency "sidekiq", ">= 2.2.1"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rr"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

end
