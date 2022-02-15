require 'simplecov'

require_relative 'helpers'
require_relative '../lib/simplecov-table'

FIXTURES_COVERAGE_DIR = 'spec/coverage'

module SimpleCov::Formatter
  describe TableFormatter do

    before(:example) do
      FileUtils.remove_dir(FIXTURES_COVERAGE_DIR, true) if Dir.exist?(FIXTURES_COVERAGE_DIR)
      SimpleCov.coverage_dir FIXTURES_COVERAGE_DIR
    end

    it 'prints an error when there is no data' do
      output = capture_stderr { TableFormatter.new.format(SimpleCov.result) }
      expect(output).to eq("No coverage data\n")
    end

    it 'prints a pretty table' do
      SimpleCov.start
      load 'fixtures/foo.rb'
      output = capture_stdout { TableFormatter.new.format(SimpleCov.result) }
      expect(output).to match(/^ Files  │ Coverage │ Uncovered lines\s+$/m)
      expect(output).to match(/^ foo\.rb │ 92\.3%    │ 15\s+$/m)
    end

    it 'groups adjacent uncovered lines together' do
      SimpleCov.start
      load 'fixtures/bar.rb'
      output = capture_stdout { TableFormatter.new.format(SimpleCov.result) }
      expect(output).to match(/^ bar\.rb │ 60\.0%    │ 3,11-13\s+$/m)
    end

  end
end
