class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  #before_action :edit_my_shop, only: [:edit]
  #before_action :delete_shop, only: [:destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  skip_authorization_check :only => [:index, :show]

  # GET /shops
  # GET /shops.json
  def index
    @shops = Shop.all.published

    @hash = Gmaps4rails.build_markers(@shops) do |shop, marker|
      marker.lat shop.latitude
      marker.lng shop.longitude
      marker.infowindow "<h5>" + shop.name + "</h5>" + "<p>" + shop.description + "</p>" + "<span class=''>" + shop.tags.name + '</span>'
      #marker.infowindow shop.description 
      #marker.infowindow shop.tags
    end    
    @my_shops = []
      @shops.each do |shop|
      if shop.user_id == current_user .id
        @my_shops << shop
      end
    end
    @shops = if params[:q].present?
       Shop.joins(:tags).where("shops.name ilike ? OR tags.name ilike ?", "%#{params[:q]}%", "%#{params[:q]}%")
    else
      Shop.all.published  
    end

  end
  # GET /shops/1
  # GET /shops/1.json
  def show

    render layout: "shop-edit"
  end

  # GET /shops/new
  def new
    @shop = Shop.new
    render layout: "shop-edit"
  end

  # GET /shops/1/edit
  def edit
    
    # si tienda.user == current_user
    render layout: "shop-edit"

  end

  # POST /shops
  # POST /shops.json
  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    #tags = params[:tags].split(',')
    #tags.each do |tag|
      #@shop.tags << Tag.new(name:tag) 
    #end
    #@shop.address = Geocoder.coordinates(params[:address])
    respond_to do |format|
      if @shop.save
        format.html { redirect_to shops_path, notice: 'La tienda se a enviado para su aprobación' }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end


  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
 

  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to backoffices_url, notice: 'Shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_tag
    @shop.tags << Tag.new(name: params[:name]) 
    redirect_to backoffices_url
  end

  def remove_tag
    tag = Tag.find(params[:tag_id])
    @shop.tags.delete(tag)
    redirect_to backoffices_url
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_params
      params.require(:shop).permit(
        :longitude, :latitude, :name, :description, :state, :address, 
        #tags_attributes:[:name, :id]
        )    
      end

end
