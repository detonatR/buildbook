# frozen_string_literal: true

require_relative '../../transformers/base_transformer'

module Buildbook
  module Transformers
    module Playlists
      class DestroyTransformer < BaseTransformer
        def transform
          playlist = find_record(playlists, 'id')
          playlists.reject! { |p| p['id'] == playlist['id'] }
        end
      end
    end
  end
end
