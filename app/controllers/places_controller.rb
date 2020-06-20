class PlacesController < ApplicationController

  # GET /places
  # GET /places.json
  def index
    @public_places = Place.where(public_status: true)
    @public_places_sharer_ids = PlacePermission.where(place_id: @public_places.ids).pluck("user_id").uniq
    @public_places_sharer_users = User.where(id: @public_places_sharer_ids)
    if current_user
      @place_permissions_share_with_current_user = PlacePermission.select {|x| x.share_with.rindex(current_user.id)}.pluck("place_id")
      @places_share_with_current_user = Place.where(id: @place_permissions_share_with_current_user)
    end
    # TODO: Create views for shared place by other user with current_user
  end

  # GET /places/1
  # GET /places/1.json
  def show
      set_place
  end

  # GET /places/new
  def new
    if current_user
      @place = Place.new
    else
      redirect_to places_url
    end
  end

  # GET /places/1/edit
  def edit
    set_user_place
  end

  # POST /places
  # POST /places.json
  def create
    share_with_array = Array.new
    logger.debug "Check_place_params: #{params[:place]}"
    logger.debug "Check_place_users_params: #{params[:place][:users]}"
    share_with_array = params[:place][:users]
    share_with_array.delete_at(0)

    @place =  current_user.places.create!(name: params[:place][:name], lat: params[:place][:lat], 
              lon: params[:place][:lon], public_status: params[:place][:public_status])

    respond_to do |format|
      if @place.save
        current_user.place_permissions.last.update(share_with: share_with_array)
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    set_user_place

    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    set_user_place
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    def set_user_place
      @place = current_user.places.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def place_params
      params.fetch(:place, {}).permit(:name, :lat, :lon, :public_status, :user_id,
      users: {},
      place_permission: {}
      )
    end
end
