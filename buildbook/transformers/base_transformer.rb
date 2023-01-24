# frozen_string_literal: true

module Buildbook
  module Transformers
    class BaseTransformer
      def initialize(data:, input:)
        @data = data
        @input = input
      end

      def process
        transform

        raise 'error' unless run_validations

        @data
      end

      private

      def transform
        nil
      end

      def run_validations
        true
      end

      def find_record(collection, column)
        record = collection.find { |c| c['id'] == @input[column] }

        raise 'error' if record.nil?

        record
      end

      def playlists
        @playlists ||= @data['playlists']
      end

      def songs
        @songs ||= @data['songs']
      end

      def users
        @users ||= @data['users']
      end
    end
  end
end
