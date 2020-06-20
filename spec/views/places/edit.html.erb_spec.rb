require 'rails_helper'

RSpec.describe "places/edit", type: :view do
  before(:each) do
    @place = assign(:place, Place.create!(
      lat: "MyString",
      lon: "MyString",
      public_status: false,
      user: nil
    ))
  end

  it "renders the edit place form" do
    render

    assert_select "form[action=?][method=?]", place_path(@place), "post" do

      assert_select "input[name=?]", "place[lat]"

      assert_select "input[name=?]", "place[lon]"

      assert_select "input[name=?]", "place[public_status]"

      assert_select "input[name=?]", "place[user_id]"
    end
  end
end
