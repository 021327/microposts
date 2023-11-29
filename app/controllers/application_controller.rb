class ApplicationController < ActionController::Base
  before_action :set_counts
  include SessionsHelper  #追記
  include Pagy::Backend

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  def set_counts
    if current_user
      @count_microposts = current_user.microposts.count
      @count_followings = current_user.followings.count
      @count_followers = current_user.followers.count
    end
  end
end
  