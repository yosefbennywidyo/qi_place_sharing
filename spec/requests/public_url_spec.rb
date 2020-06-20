require 'rails_helper'
RSpec.describe "Public URL" do
  it "allow unregistered Users to see Public URL" do
    user = User.create(email: "test@test.com", username: "test", password: "password", password_confirmation: "password")

    get root_path
    expect(response).to render_template("home/index")
    
    get profile_path(user.username)
    expect(response).to have_http_status(:ok)

    user_test = User.find_by_email("test@test.com")
    user_test.destroy
  end
end