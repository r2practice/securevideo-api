module Securevideo
  module Api
    class Participant
      include Her::Model
      uses_api Securevideo::Api.api
      collection_path "participant/:SessionId"
      attributes :SessionId

      validates :SessionId, presence: true

      class << self
        def add(session_id, participant_options = {})
          Response.new(post("participant/#{session_id}", participant_options))
        end

        def remove(participant_id)
          Response.new(delete("participant/#{participant_id}"))
        end
      end
    end
  end
end
