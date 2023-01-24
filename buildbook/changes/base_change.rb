# frozen_string_literal: true

module Buildbook
  module Changes
    class BaseChange
      def initialize(filename)
        @filename = filename
      end

      def process(data)
        rows = data

        changes.each do |c|
          transformer = transformer_from_change(c).new(
            data: rows,
            input: input_from_change(c)
          )

          rows = transformer.process
        end

        rows
      end
    end
  end
end
