require 'rails_helper'

RSpec.describe "places/show", type: :view do
=begin
TODO: Test for create places
  before(:each) do
    @place = assign(:place, Place.create!(
      name: "Place",
      lat: "Lat",
      lon: "Lon",
      public_status: false,
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Place/)
    expect(rendered).to match(/Lon/)
    expect(rendered).to match(/false/)
    #nil
    #expect(rendered).to match(//)
  end
=end
end
