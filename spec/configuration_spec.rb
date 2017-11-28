require "spec_helper"

RSpec.describe YojeeApi::Configuration do
  let(:locahost) { 'localhost:3000' }

  it "set base uri configuration" do
    YojeeApi.configure do |config|
      config.base_url = locahost
    end
    expect(YojeeApi.config.base_url).to eq(locahost)
  end
end
