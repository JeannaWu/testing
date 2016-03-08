Rails.application.routes.draw do
  devise_for :users
  resources :users do
    member do
    get :follow
    get :unfollow
    get :following, :followers
    
end
end




  resources :categories 
   
  

 resources :posts do
 	member do
 		get "like", to:"posts#upvote"
 		get "dislike", to:"posts#downvote"
 	end
 	resources :comments do
      member do
        get "like", to:"comments#upvote"
        get "dislike", to:"comments#downvote"
  end
  end
 end


 
  root 'posts#index'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'users/professional_user'
  resources :follows
  
end
