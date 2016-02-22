class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def show
		@user = User.where(:name => params[:name]).first
    
        
    # @posts = @user.posts.paginate(page: params[:page], per_page: 20)

        
	end
  def new
     @user = User.new
     
  end

	 def posts
    @user = User.where(:name => params[:name]).first

    @current_page = params[:page].present? ? params[:page] : 1
    @topics = @user.topics.page(@current_page).per(20).order('created_at DESC')

    @title = "#{@user.name} All Posts"
  
  end
  def edit
  	@user = current_user
    @user.build_account unless @user.account.present?
  end

  

    def update_avatar
    @user = current_user
    if params[:user].present?
      if @user.update_without_password(user_params)
        flash[:success] = 'Setting avatar successfully'
        redirect_to settings_path + '#avatar'
      else
        flash[:error] = 'Setting avatar unsuccessfully'
        render :edit
      end
    else
      redirect_to settings_path + '#avatar', :notice => 'Select your avatar'
    end
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    respond_to do |format|
      format.js {render :action=>"follow"}
  end
end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    respond_to do |format|
      format.js {render :action=>"unfollow"}
  end
end

  

	private
	def user_params
      params.require(:user).permit(:name, :email, :password, 
                                   :password_confirmation, :gender,:avatar)
    end
end
