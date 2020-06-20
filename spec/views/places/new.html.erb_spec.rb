require 'rails_helper'

RSpec.describe "places/new", type: :view do
  before(:each) do
    assign(:place, Place.new(
      lat: "MyString",
      lon: "MyString",
      public_status: false,
      user: nil
    ))
  end

  it "renders new place form" do
    render

    assert_select "form[action=?][method=?]", places_path, "post" do

      assert_select "input[name=?]", "place[lat]"

      assert_select "input[name=?]", "place[lon]"

      assert_select "input[name=?]", "place[public_status]"

      assert_select "input[name=?]", "place[user_id]"
    end
  end
end
