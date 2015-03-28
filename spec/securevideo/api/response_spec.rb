require 'spec_helper'

describe Securevideo::Api::Response  do
  context '#success?' do
    it 'should be true is success' do
      res = Securevideo::Api::Response.new(Struct.new(:ok).new('d'))
      expect(res.success?).to be true
    end
    it 'should be false is not success' do
      res = Securevideo::Api::Response.new(Struct.new(:Message).new('Error'))
      expect(res.success?).to be false
    end
  end

  context '#status' do
    it 'should return :ok status if it is success' do
      res = Securevideo::Api::Response.new(Struct.new(:ok).new('d'))
      expect(res.status).to eq(:ok)
    end
    it 'should return :error status if it is fail' do
      res = Securevideo::Api::Response.new(Struct.new(:Message).new('Error'))
      expect(res.status).to eq(:error)
    end
  end

  context 'error message' do
    it '#error_message' do
      res = Securevideo::Api::Response.new(Struct.new(:Message).new('Error'))
      expect(res.error_message).to eq('Error')
    end

    it '#error_details' do
      res = Securevideo::Api::Response.new(Struct.new(:Message, :MessageDetail).new('Error', 'Error details'))
      expect(res.error_details).to eq('Error details')
    end
  end
end
