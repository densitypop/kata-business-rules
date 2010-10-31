require 'rspec/core/formatters/base_text_formatter'

module RSpec
  module Core
    module Formatters
      class MakeOutputFormatter < BaseTextFormatter

        def example_failed(example)
          exception = example.metadata[:execution_result][:exception_encountered]

          message = exception.message.gsub(/\n/, "")
          line_number = example.metadata[:line_number]
          file_path = example.metadata[:file_path]

          output.puts "#{file_path}:#{line_number} #{message}"
        end

        def dump_summary(duration, example_count, failure_count, pending_count)
        end

      end
    end
  end
end
