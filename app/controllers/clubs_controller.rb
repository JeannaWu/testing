class ClubsController < ApplicationController
	def index
        @club = Club.paginate(page: params[:page], per_page: 20).order(created_at: :desc)
      end
	def show
		@club = Club.find(params[:id])
	end
	def destroy
      	Club.find(params[:id]).destroy
         flash[:success] = "Club deleted"
         redirect_to clubs_url
  end
  def new
    @club = Club.new
  end
end
