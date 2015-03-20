module Securevideo
  module Api
    class Session
      include Her::Model
      uses_api Securevideo::Api.api
      #primary_key :SystemUserId
      collection_path "session/:user_id"

      attributes :user_id

    end
  end
end
