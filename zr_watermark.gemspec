# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zr_watermark/version'

Gem::Specification.new do |spec|
  spec.name          = "zr_watermark"
  spec.version       = ZrWatermark::VERSION
  spec.authors       = ["cursorzz"]
  spec.email         = ["cursorzz@163.com"]

  spec.summary       = %q{zhiren watermark generator}
  spec.description   = %q{zhiren watermark generator}
  spec.homepage      = "https://github.com/mycolorway/zr_watermark"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ["watermark"]
  spec.require_paths = ["lib"]

  spec.add_dependency "ruby-progressbar", "~> 1.8.1"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "byebug", "~> 9.0.6"
end
