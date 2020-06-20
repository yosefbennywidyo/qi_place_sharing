require 'rails_helper'

RSpec.describe "places/show", type: :view do
  before(:each) do
    @place = assign(:place, Place.create!(
      lat: "Lat",
      lon: "Lon",
      public_status: false,
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Lat/)
    expect(rendered).to match(/Lon/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
