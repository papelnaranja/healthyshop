class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  before_action :edit_my_shop, only: [:edit]
  before_action :delete_shop, only: [:destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  skip_authorization_check :only => [:index, :show]

  # GET /shops
  # GET /shops.json
  def index
    @shops = Shop.all.published    
    
    @shops = if params[:q].present?
              Shop.where("name like ?", "%#{params[:q]}%")
          else
            Shop.all.published  
          end

  end
  # GET /shops/1
  # GET /shops/1.json
  def show
  end

  # GET /shops/new
  def new
    @shop = Shop.new
  end

  # GET /shops/1/edit
  def edit
    # si tienda.user == current_user
  end

  # POST /shops
  # POST /shops.json
  def create
    @shop = Shop.new(shop_params)
    #@shop.user_id = current_user.id

    respond_to do |format|
      if @shop.save
        format.html { redirect_to @shop, notice: 'Shop was successfully created.' }
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
      format.html { redirect_to shops_url, notice: 'Shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_params
      params.require(:shop).permit(:longitude, :latitude, :name, :photo, :description, :state, :address)
    end

    def edit_my_shop 
      if @shop.user_id != current_user.id && current_user.role != "admin"
        redirect_to shops_url
      end
    end
    def delete_shop
      if current_user.role != "admin"
        redirect_to shops_url
      end
    end
end
