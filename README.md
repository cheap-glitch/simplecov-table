# 📊 simplecov-table

[![License](https://shields.io/github/license/cheap-glitch/simplecov-table)](LICENSE)
[![Latest release](https://shields.io/github/v/release/cheap-glitch/simplecov-table?sort=semver&label=latest%20release&color=green)](https://github.com/cheap-glitch/simplecov-table/releases/latest)

This   is   a  custom   [SimpleCov](https://github.com/simplecov-ruby/simplecov)
formatter that  displays table-formatted summaries  of your coverage  reports in
the terminal. It prints the total coverage ratio of each source file, along with
a compressed list of the uncovered lines.

```
────────────────────┬──────────┬──────────────────────────────────────
 Files              │ Coverage │ Uncovered lines
────────────────────┼──────────┼──────────────────────────────────────
 lib/foo.rb         │ 78.0%    │ 11,12,20-27
 lib/foo/bar.rb     │ 100.0%   │
 lib/foo/baz.rb     │ 33.5%    │ 3,5,63-75,122,128
────────────────────┴──────────┴──────────────────────────────────────
```

## Installation

```
gem install simplecov-table
```

## Usage

```ruby
require 'simplecov'
require 'simplecov-table'

SimpleCov.formatter = SimpleCov::Formatter::TableFormatter
SimpleCov.start
```

Or, if you want to use several formatters:

```ruby
require 'simplecov'
require 'simplecov-table'

SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::TableFormatter,
])
SimpleCov.start
```

## Changelog

See the full changelog [here](https://github.com/cheap-glitch/simplecov-table/releases).

## Contributing

Contributions are welcomed! Please open an issue before submitting substantial changes.

## Related

 * [`simplecov-erb`](https://github.com/kpaulisse/simplecov-erb) – Flexible plain-text formatter that uses ERB templates
 * [`simplecov-lcov`](https://github.com/fortissimo1997/simplecov-lcov) – Simple LCOV formatter

## License

ISC
