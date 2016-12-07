# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tv_schedule_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "tv_schedule_parser"
  spec.version       = TvScheduleParser::VERSION
  spec.authors       = ["j2FunOnly"]
  spec.email         = ["j2funonly@ya.ru"]

  spec.summary       = %q{Parse tv.yandex.ru and saves it to pdf}
  spec.description   = %q{This Gem parses tv schedule from tv.yandex.ru and saves it to pdf}
  spec.homepage      = ""
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = ""
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.require_paths = ["lib"]

  spec.add_dependency 'prawn', '~> 2.1.0'
  spec.add_dependency 'nokogiri', '~> 1.6.8.1'
  spec.add_dependency 'httparty', '~> 0.14.0'

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
