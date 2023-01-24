# frozen_string_literal: true

module Buildbook
  module Sources
    class BaseSource
      def initialize(source)
        @rows = File.read(source)
      end
    end
  end
end
