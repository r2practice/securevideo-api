require 'spec_helper'

describe Securevideo::Api::Session, vcr: true do
  describe 'list sessions' do
    it 'should return sessions' do
      expect(Securevideo::Api::Session.all(UserId: 12281).fetch)
        .to eq([
                 Securevideo::Api::Session.new( 'ScheduleTs' => "2016-04-16T15:00:00",
                                                'BillableTs' => nil, 'BillableStatusCd' => nil,
                                                'UserId' => 12281, 'IsRecorded' => false,
                                                'Participants' => [
                                                  {"ParticipationId"=>71896,
                                                   "ParticipantFullName"=>"Test User",
                                                   "SecureVideoUserId"=>12281,
                                                   "ParticipantEmailAddress"=>"test@test.com",
                                                   "ParticipantSmsNumber"=>"",
                                                   "ParticipantDefaultResolution"=>"high",
                                                   "ParticipantTimeZoneWindowsId"=>"Pacific Standard Time",
                                                   "ConnectCode"=>204848645,
                                                   "ShouldAutoDeliverCode"=>"E",
                                                   "ConnectionTs"=>nil,
                                                   "ExpiresTs"=>nil,
                                                   "RSVP"=>"Unknown"},
                                                  {"ParticipationId"=>71897,
                                                   "ParticipantFullName"=>"Trevor",
                                                   "SecureVideoUserId"=>nil,
                                                   "ParticipantEmailAddress"=>"trevor@geemail.com",
                                                   "ParticipantSmsNumber"=>"3124455566",
                                                   "ParticipantDefaultResolution"=>"default",
                                                   "ParticipantTimeZoneWindowsId"=>"Hawaiian Standard Time",
                                                   "ConnectCode"=>207464714,
                                                   "ShouldAutoDeliverCode"=>"S",
                                                   "ConnectionTs"=>nil, "ExpiresTs"=>nil,
                                                   "RSVP"=>"Unknown"}], 'SessionId' => 36208)
               ])
    end
  end
  describe 'create session' do
    it 'should return session' do
      res = Securevideo::Api::Session.new(UserId: 12281, "ScheduleTs": "2016-04-16T15:00:00", "Participants":[{ "ParticipantFullName": "Trevor", "ParticipantEmailAddress": "trevor@geemail.com", "ParticipantSmsNumber": "3124455566", "ParticipantDefaultResolution": "default", "ParticipantTimeZoneWindowsId": "Hawaiian Standard Time", "ShouldAutoDeliverCode": "S"}])
      res.save

    end
  end

  describe 'reschedule' do
    context 'for instance' do
      it 'should update session' do
        session = Securevideo::Api::Session.all(UserId: 12281).first
        res = session.reschedule("2017-02-04T22:00:00")
        expect(res.success?).to be true
      end
    end

    context 'by session id' do
      it 'should update session' do
        res = Securevideo::Api::Session.reschedule('36208', "2017-02-04T22:00:00")
        expect(res.success?).to be true
      end
    end
  end

  describe 'cancel' do
    context 'for instance' do
      it 'shouls be delete session' do
        session = Securevideo::Api::Session.all(UserId: 12281).first
        res = session.destroy
        expect(res.success?).to be true
      end
    end
    describe 'by session id' do
      it 'shouls be delete session' do
        res = Securevideo::Api::Session.cancel('36209')
        expect(res.success?).to be true
      end
    end
  end
end
