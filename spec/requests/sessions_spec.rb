require 'rails_helper'
RSpec.describe "Sessions" do
  it "signs user in and out" do
    user = User.create(email: "test@test.com", password: "password", password_confirmation: "password")
    sign_in user
    get root_path
    expect(response).to render_template("home/index")
    
    sign_out user
    get root_path
    expect(response).not_to render_template("home/index")

    user_test = User.find_by_email("test@test.com")
    user_test.destroy
  end
end