lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sblogistica/version"
Gem::Specification.new do |s|
  s.name        = 'sblogistica'
  s.version     = Sblogistica::VERSION
  s.date        = '2022-05-05'
  s.summary     = "Sblogistica"
  s.description = ""
  s.authors     = ["Pavel Osetrov"]
  s.email       = 'pavel.osetrov@me.com'
  s.files = Dir['lib/**/*', 'LICENSE', 'README.markdown']

  s.homepage    = 'https://github.com/osetrov/sblogistica'
  s.license       = 'MIT'

  s.add_dependency('faraday', '>= 0.16.0')
  s.add_dependency('multi_json', '>= 1.11.0')
  s.add_dependency('irb', '>= 1.3.6')

  s.require_paths = ["lib"]
  s.required_ruby_version = '>= 2.5'
end

