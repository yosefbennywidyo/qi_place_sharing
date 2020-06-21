require 'rails_helper'

RSpec.describe "places/index", type: :view do
=begin
TODO: Test for create places
  before(:each) do
    assign(:places, [
      Place.create!(
        name: "Place-1",
        lat: 0.0,
        lon: 0.0,
        public_status: false
      ),
      Place.create!(
        name: "Place-2",
        lat: 0.0,
        lon: 0.0,
        public_status: true,
      )
    ])
  end

  it "renders a list of places" do
    render
    assert_select "h5", text: "Place-1".to_s, count: 1
    assert_select "h5", text: "Place-2".to_s, count: 1
    assert_select "p", text: "Shared by: false".to_s, count: 1
    assert_select "p", text: "Shared by: true".to_s, count: 1
  end
=end
end
