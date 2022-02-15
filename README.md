# 📊 simplecov-table

![License](https://badgen.net/github/license/cheap-glitch/simplecov-table?color=green)
![Latest release](https://badgen.net/github/release/cheap-glitch/simplecov-table?color=green)

This   is   a  custom   [SimpleCov](https://github.com/simplecov-ruby/simplecov)
formatter that displays  table-formatted coverage summaries in  the terminal. It
prints the total coverage  of each source file, along with  a compressed list of
its uncovered lines:

```text
────────────────────┬──────────┬──────────────────────────────────────────
 Files              │ Coverage │ Uncovered lines
────────────────────┼──────────┼──────────────────────────────────────────
 lib/foo.rb         │ 78.0%    │ 11,12,20-27
 lib/foo/bar.rb     │ 100.0%   │
 lib/foo/baz.rb     │ 33.5%    │ 3,5,63-75,122,128
────────────────────┴──────────┴──────────────────────────────────────────
```

## Installation

```shell
gem install simplecov-table
```

## Usage

```ruby
require 'simplecov-table'

SimpleCov.formatter = SimpleCov::Formatter::TableFormatter
```

Or, if you want to use several formatters:

```ruby
require 'simplecov-table'

SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::TableFormatter,
])
```

## Changelog

See the full changelog [here](https://github.com/cheap-glitch/simplecov-table/releases).

## Contributing

Contributions are welcomed! Please open an issue before submitting substantial changes.

## Related

 * [simplecov-erb](https://github.com/kpaulisse/simplecov-erb) - Flexible plain-text formatter that uses ERB templates
 * [simplecov-lcov](https://github.com/fortissimo1997/simplecov-lcov) - Simple LCOV formatter

## License

ISC
