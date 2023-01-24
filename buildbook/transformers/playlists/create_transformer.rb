# frozen_string_literal: true

require 'json'
require_relative '../../transformers/base_transformer'
require_relative '../../validators/songs_count_validator'

module Buildbook
  module Transformers
    module Playlists
      class CreateTransformer < BaseTransformer
        def transform
          @item = JSON.parse(new_playlist)
          playlists << @item
        end

        private

        def run_validations
          Validators::SongsCountValidator.validate(@item)
        end

        def new_playlist
          @new_playlist ||= {
            id: generate_id.to_s,
            owner_id: @input['owner_id'],
            song_ids: @input['song_ids']
          }.to_json
        end

        def user
          find_record(users, 'owner_id')
        end

        def generate_id
          playlists.last['id'].to_i + 1
        end
      end
    end
  end
end
