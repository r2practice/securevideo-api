module Securevideo
  module Api
    class User
      include Her::Model
      uses_api Securevideo::Api.api
      primary_key :SystemUserId
      collection_path 'user'

      attributes :FullName, :EmailAddress, :TimeZoneWindowsId, :HelpNumber
      validates :FullName, presence: true
      validates :EmailAddress, presence: true
      validates :TimeZoneWindowsId, presence: true, inclusion: Api::TimeZones::TIME_ZONES
      validates :HelpNumber, presence: true


      def update_password(new_password)
        res = self.class.put("password/#{id}", { "NewPassword" => new_password })
        if res.Message.nil?
          Struct.new(:status).new(:ok)
        else
          Struct.new(:status, :message).new(:error, res.Message)
        end
      end
    end
  end
end
