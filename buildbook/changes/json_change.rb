# frozen_string_literal: true

require 'json'

require_relative 'base_change'

require_relative '../transformers/playlists/create_transformer'
require_relative '../transformers/playlists/destroy_transformer'
require_relative '../transformers/playlists_songs/create_transformer'

module Buildbook
  module Changes
    class JsonChange < BaseChange
      TYPES = %w[
        Playlist
        PlaylistsSong
      ].freeze

      TRANSFORMERS = %w[
        CREATE
        DESTROY
      ].freeze

      private

      def transformer_from_change(change)
        type = change['type']
        key = change['key']

        raise 'unexpected type' unless TYPES.include? type
        raise 'unexpected key' unless TRANSFORMERS.include? key

        transformer = "#{key.capitalize}Transformer"

        Object.const_get "Buildbook::Transformers::#{type}s::#{transformer}"
      end

      def input_from_change(change)
        change['input']
      end

      def changes
        file = File.read(@filename)
        json = JSON.parse(file)

        json['changes']
      end
    end
  end
end
