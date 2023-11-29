class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite_microposts << micropost
    redirect_to root_url
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite_microposts.delete(micropost)
    redirect_to root_url
  end
end
