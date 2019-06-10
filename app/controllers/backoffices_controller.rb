class BackofficesController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource :class => false
  
  def index
    @shops = Shop.all
  end
  def users 
    @users = User.all
  end
  
end
