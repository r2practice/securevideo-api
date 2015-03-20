module Securevideo
  module Api
    class Participant
      include Her::Model
      uses_api Securevideo::Api.api
      collection_path "participant/:SessionId"
      attributes :SessionId

      validates :SessionId, presence: true
    end
  end
end
