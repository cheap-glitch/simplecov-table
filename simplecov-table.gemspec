Gem::Specification.new do |s|
  s.name         = 'simplecov-table'
  s.version      = '0.1.0'
  s.summary      = 'A custom SimpleCov formatter to display summaries of coverage reports in table format.'
  s.description  = 'A custom SimpleCov formatter that displays table-formatted summaries of your coverage reports in the terminal. It prints the total coverage ratio of each source file, along with a compressed list of the uncovered lines.'
  s.authors      = ['cheap glitch']
  s.email        = 'cheap.glitch@gmail.com'
  s.homepage     = 'https://github.com/cheap-glitch/simplecov-table'
  s.license      = 'ISC'
  s.require_path = 'lib'
  s.files        = Dir[
    'LICENSE',
    'lib/***/*.rb',
    'spec/**/*.rb',
    'simplecov-table.gemspec',
  ]
  s.extra_rdoc_files = [
    'LICENSE',
    'README.md',
  ]
end
