# frozen_string_literal: true

module Buildbook
  module Destinations
    class FileDestination
      def self.process(records, filename)
        new(data: records, filename: filename).process
      end

      def initialize(data:, filename: 'output.json')
        @data = data
        @filename = filename
      end

      def process
        File.write(@filename, JSON.pretty_generate(@data))
      end
    end
  end
end
