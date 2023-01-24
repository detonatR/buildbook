# frozen_string_literal: true

require_relative 'sources/json_source'
require_relative 'changes/json_change'
require_relative 'destinations/file_destination'

module Buildbook
  class Parser
    def self.run(arg1, arg2)
      new(source: arg1, changes: arg2).process
    end

    def initialize(source:, changes:)
      @source = source
      @changes = changes
      @data = {}
    end

    def process
      source Sources::JsonSource, @source

      process_changes Changes::JsonChange, @changes

      destination Destinations::FileDestination
    end

    private

    def process_changes(type, filename)
      @data = type.new(filename).process(@data)
    end

    def source(type, filename)
      @data = type.new(filename).process
    end

    def destination(destination)
      destination.process(@data)
    end
  end
end
