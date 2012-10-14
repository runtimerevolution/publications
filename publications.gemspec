# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'publications'
  s.version           = '0.1'
  s.description       = 'Advanced model publication handling for Rails'
  s.summary           = 'Advanced model publication handling for Rails'  
  s.date              = '2012-10-13'
  s.require_paths     = %w(lib)
  s.files             = Dir["{lib}/**/*"]
  
  # Runtime dependencies
  #s.add_dependency             'refinerycms-core',    '~> 2.0.7'

  # Development dependencies (usually used for testing)
  #s.add_development_dependency 'refinerycms-testing', '~> 2.0.7'
end
