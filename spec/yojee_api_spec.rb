require "spec_helper"

RSpec.describe YojeeApi do
  describe 'version' do
    it "has a version number" do
      expect(YojeeApi::VERSION).not_to be nil
    end
  end
end
