require 'rails_helper'

RSpec.describe "places/edit", type: :view do
  before(:each) do
    @user = User.create(email: "test@test.com", username: "test", password: "password", password_confirmation: "password")
    @place = assign(:place, Place.create!(
      name: "Place Test",
      lat: 0.0,
      lon: 0.0,
      public_status: false,
    ))
  end

  it "renders the edit place form" do
    render

    assert_select "form[action=?][method=?]", place_path(@place), "post" do

      assert_select "input[name=?]", "place[name]"
      
      assert_select "input[name=?]", "place[lat]"

      assert_select "input[name=?]", "place[lon]"

      assert_select "input[name=?]", "place[public_status]"

    end
  end
end
