class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    @micropost = Micropost.find(params[:id])
    current_user.favorite(@micropost)
    flash[:success] = '投稿にいいねをしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    current_user.unfavorite(@micropost)
    flash[:success] = '投稿のいいねを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end