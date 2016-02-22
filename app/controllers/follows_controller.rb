class FollowsController < ApplicationController
	before_action :authenticate_user!
  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
    @club = Club.find(params[:id])
    current_user.follow(@club)
    respond_to do |format|
      format.html { redirect_to @club }
      format.js
    end

  end

  def destroy
    @user = User.find(params[:id]).followed
    current_user.stop_following(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
    @club = Club.find(params[:user_id])
    current_user.stop_following(@club)
    respond_to do |format|
      format.html { redirect_to @club }
      format.js
    end
  end
end
