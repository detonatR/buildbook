# frozen_string_literal: true

module Buildbook
  module Validators
    class SongsCountValidator
      def self.validate(item)
        return false unless item['song_ids'].count >= 1

        true
      end
    end
  end
end
