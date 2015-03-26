require 'spec_helper'

describe Securevideo::Api::User, vcr: true do

  describe 'GET get users' do
    it 'should return user list' do
      expect(Securevideo::Api::User.all.fetch).to eq([Securevideo::Api::User.new('FullName' =>"Test User",
                                                                                 'EmailAddress' => "test@test.com",
                                                                                 'SmsNumber' => "",
                                                                                 'DefaultResolution' => "high",
                                                                                 'TimeZoneWindowsId' => "Pacific Standard Time",
                                                                                 'HelpNumber' => "4084062331",
                                                                                 'VideoId' => "securevideo+sv000001216323790188",
                                                                                 'SystemUserId' => "12163")])
    end
  end

  describe 'GET get user' do
    it 'should return user' do
    expect(Securevideo::Api::User.find(12163)).to eq(Securevideo::Api::User.new('FullName' =>"Test User",
                                                                               'EmailAddress' => "test@test.com",
                                                                               'SmsNumber' => "",
                                                                               'DefaultResolution' => "high",
                                                                               'TimeZoneWindowsId' => "Pacific Standard Time",
                                                                               'HelpNumber' => "4084062331",
                                                                               'VideoId' => "securevideo+sv000001216323790188",
                                                                               'SystemUserId' => "12163"))
    end
  end

  describe 'POST create user' do
    it 'should create user' do
      user = Securevideo::Api::User.new(FullName: 'Test User',
                                        TimeZoneWindowsId: "Pacific Standard Time",
                                        EmailAddress: 'testuser@test.com',
                                        HelpNumber: '4084062331')
      user.save
      expect(user.id).to be_present
    end
  end

  describe 'PUT update user' do
    it 'should update user' do
      user = Securevideo::Api::User.find 12283
      user.FullName = 'testUserName'
      user.save
      expect(Securevideo::Api::User.find(12283).FullName).to eq('testUserName')
    end
  end

  describe 'DELETE delete user' do
    it 'delete user' do
      user = Securevideo::Api::User.find 12283
      user.destroy
      expect(Securevideo::Api::User.find(12283)).to be_nil
    end
  end
end
