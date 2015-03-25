module Securevideo
  module Api
    class Session
      include Her::Model
      uses_api Securevideo::Api.api
      primary_key :SessionId
      collection_path 'session/:UserId'

      attributes :UserId, :ScheduleTs, :Participants
      validates :UserId, presence: true
      validates :ScheduleTs, presence: true
      validates :Participants, presence: true

      def reschedule(schedule_ts)
        self.class.reschedule(id, schedule_ts)
      end

      def destroy
        self.class.cancel(id)
      end

      class << self
        def cancel(session_id)
          Response.new(delete("session/#{session_id}"))
        end

        def reschedule(session_id, schedule_ts)
          Response.new(put("session/#{session_id}", 'ScheduleTs' => schedule_ts))
        end

        #
        # @params month - 2014-01-01
        #
        def usage(month)
          get('usage', { :month => month })
        end

        def login(user_id, redirect_to_on_expiry)
          post("login/#{user_id}",
               'RedirectToUriOnExpiry' => redirect_to_on_expiry)
        end

        def logout(login_guid)
          destroy("session/#{login_guid}")
        end
      end
    end
  end
end
