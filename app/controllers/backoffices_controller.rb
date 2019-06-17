class BackofficesController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource :class => false
  
  def index
    @shops = Shop.all
  end
  def users 
    @users = User.all
  end
  def tags
    @tags = Tags.all
  end
  def remove_tag
    tag = Tag.find(params[:tag_id])
    @shop.tags.delete(tag)
    redirect_to backoffices_path
  end


end
