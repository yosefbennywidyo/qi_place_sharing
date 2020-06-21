class UsersController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]

  def index
    @users = User.all
  end

  def show
    @public_places = Place.where(public_status: true)

    @user = User.find_by_username(params[:username])

    @place_share_with_this_user = PlacePermission.select {|x| x.user_id === "#{@user.id}".to_i}.pluck("place_id")

    @public_place_share_with_this_user = Place.where(id: @place_share_with_this_user).select {|x| x.public_status === true}

    logger.debug "Check_user_name_params: #{params[:username]}"
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
