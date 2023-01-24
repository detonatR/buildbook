# frozen_string_literal: true

require 'json'

require_relative 'base_source'

module Buildbook
  module Sources
    class JsonSource < BaseSource
      def process
        JSON.parse(@rows)
      end
    end
  end
end
