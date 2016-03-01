class ClubsController < ApplicationController
	def index
        @club = Club.paginate(page: params[:page], per_page: 20).order(created_at: :desc)
  end
  
	def show
		@club = Club.find(params[:id])
    render 'show'
	end
	def destroy
      	Club.find(params[:id]).destroy
         flash[:success] = "Club deleted"
         redirect_to clubs_url
  end
  def new
    @club = Club.new
  end
      def joining
          @title = "Joining"
          @user  = User.find(params[:id])
          @clubs = @user.follow_count.paginate(page: params[:page])
         render 'show_join'
        end


         def follow
            @club = Club.find(params[:id])
            current_user.follow(@club)
            respond_to do |format|
            format.html { redirect_to @club }
            format.js
            end
        end
   def unfollow
   @club = Club.find(params[:id])
    current_user.stop_following(@club)
     respond_to do |format|
      format.html { redirect_to @club }
      format.js
end
end
end
