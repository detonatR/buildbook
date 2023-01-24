# frozen_string_literal: true

require_relative '../../transformers/base_transformer'

module Buildbook
  module Transformers
    module PlaylistsSongs
      class CreateTransformer < BaseTransformer
        def transform
          playlist['song_ids'] << song['id']
          playlist['song_ids'].uniq!
        end

        private

        def playlist
          find_record(playlists, 'playlist_id')
        end

        def song
          find_record(songs, 'song_id')
        end
      end
    end
  end
end
