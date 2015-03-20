module Securevideo
  module Api
    class Participant
      include Her::Model
      uses_api Securevideo::Api.api
      collection_path "participant/:session_id"
      attributes :session_id
    end
  end
end
