require "spec_helper"

RSpec.describe YojeeApi::TestSupport do
  let(:locahost) { 'localhost:3000' }

  before do
    YojeeApi.configure do |config|
      config.base_url = locahost
    end
  end

  describe "#setup_company" do
    it 'setup company successfully' do
      token = YojeeApi::TestSupport.setup_company
      puts token
    end
  end
end
