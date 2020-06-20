require 'rails_helper'

RSpec.describe "places/index", type: :view do
  before(:each) do
    assign(:places, [
      Place.create!(
        lat: "Lat",
        lon: "Lon",
        public_status: false,
        user: nil
      ),
      Place.create!(
        lat: "Lat",
        lon: "Lon",
        public_status: false,
        user: nil
      )
    ])
  end

  it "renders a list of places" do
    render
    assert_select "tr>td", text: "Lat".to_s, count: 2
    assert_select "tr>td", text: "Lon".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
