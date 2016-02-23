class FollowsController < ApplicationController
	before_action :authenticate_user!
  def join
  @club = Club.find(params[:id])
    current_user.follow(@club)
     respond_to do |format|
      format.html { redirect_to @club }
      format.js
end
   def exit
   @club = Club.find(params[:id])
    current_user.stop_following(@club)
     respond_to do |format|
      format.html { redirect_to @club }
      format.js
end
end
