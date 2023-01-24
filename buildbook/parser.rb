# frozen_string_literal: true

require_relative 'sources/json_source'
require_relative 'changes/json_change'
require_relative 'destinations/file_destination'

module Buildbook
  class Parser
    def self.run(arg1, arg2, arg3)
      new(source: arg1, changes: arg2, output: arg3).process
    end

    def initialize(source:, changes:, output:)
      @source = source
      @changes = changes
      @output = output
      @data = {}
    end

    def process
      source Sources::JsonSource, @source

      process_changes Changes::JsonChange, @changes

      destination Destinations::FileDestination, @output
    end

    private

    def process_changes(type, filename)
      @data = type.new(filename).process(@data)
    end

    def source(type, filename)
      @data = type.new(filename).process
    end

    def destination(destination, filename)
      destination.process(@data, filename)
    end
  end
end
