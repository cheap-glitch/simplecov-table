fail 'simplecov-table requires simplecov' unless defined?(SimpleCov)
require 'io/console'

module SimpleCov
  module Formatter
    class TableFormatter

      def format(coverage)
        if coverage == nil then
          $stderr.puts 'No coverage data'
          return
        end

        table = {
          'Files'           => ['Files'],
          'Coverage'        => ['Coverage'],
          'Uncovered lines' => ['Uncovered lines'],
        }

        coverage.files.each do |file|
          if file.no_lines? then
            continue
          end
          table['Files'].push(File.basename(file.filename))
          table['Coverage'].push(file.covered_percent.round(1).to_s + '%')
          table['Uncovered lines'].push(group_lines(file.missed_lines))
        end

        print_table(table)
      end

      private

      def group_lines(lines)
        if lines.length == 0 then
          return ''
        end

        groups = []
        group_start = group_end = lines.first.number

        lines[1..].each do |line|
          if line.number == group_end + 1 then
            group_end = line.number
          else
            add_group(groups, group_start, group_end)
            group_start = group_end = line.number
          end
        end
        # Ensure the last group is closed
        add_group(groups, group_start, group_end)

        groups.join(',')
      end

      def add_group(groups, group_start, group_end)
        if group_end == nil || group_end == group_start then
          groups.push(group_start.to_s)
        elsif group_end == group_start + 1
          groups.push(group_start.to_s, group_end.to_s)
        else
          groups.push(group_start.to_s + '-' + group_end.to_s)
        end
      end

      def print_table(table)
        headers = table.keys
        columns = table.values

        terminal_width = IO.console.winsize[1]
        columns_widths = columns[0..-2].map { |column| column.map(&:length).max }
        # The last column takes all the remaining horizontal space
        columns_widths.push(terminal_width - (columns_widths.sum + 3*columns_widths.length) - 2)

        rows = columns.first
          .each_index
          .map { |row_index| get_row(columns.map { |column| column[row_index] }, columns_widths) }

        print [
          '',
          get_row_separator(columns_widths, '┬'),
          get_row(headers, columns_widths),
          get_row_separator(columns_widths, '┼'),
          rows[1..].join("\n"),
          get_row_separator(columns_widths, '┴'),
          "\n",
        ].join("\n")
      end

      def get_row(cells, columns_widths)
        row = cells
          .map.with_index { |cell, index| pad_string(cell, columns_widths[index]) }
          .join(' │ ')
        ' ' + row
      end

      def get_row_separator(columns_widths, cell_separator)
        columns_widths
          .map { |width| '─' * (width + 2) }
          .join(cell_separator)
      end

      def pad_string(string, length)
        string + ' ' * (length - string.length)
      end

    end
  end
end
