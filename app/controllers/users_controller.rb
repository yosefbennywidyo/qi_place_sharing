class UsersController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]

  def index
    @users = User.all
  end

  def show
    logger.debug "Check_user_name_params: #{params[:username]}"
    @user = User.find_by_username(params[:username])
    logger.debug "Check_user: #{@user}"
    if @user
      render action: :show
      return
    else
      render file: 'public/404', status: 404, formats: [:html]
      return
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:id, :email, :username)
    end

end
