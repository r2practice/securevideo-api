module Securevideo
  module Api
    class User
      include Her::Model
      uses_api Securevideo::Api.api
      primary_key :SystemUserId
      collection_path "user"

      #has_many :sessions
      # FullName="Test_1"
      # EmailAddress="test1@example.com"
      # SmsNumber=""
      # DefaultResolution="high"
      # TimeZoneWindowsId="Pacific Standard Time"
      # HelpNumber="4084062331"
      # VideoId="securevideo+sv000000626424376897"
      # SystemUserId="6264"
    end
  end
end
