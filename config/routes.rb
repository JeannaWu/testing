Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:show] do
    member do
      get :follows
      get :unfollows
      post :follows
      post :unfollows
      get :block
      get :followers
      get :following
      get :posts
    end
  end



  resources :clubs do
  end
  

 resources :posts do
 	member do
 		get "like", to:"posts#upvote"
 		get "dislike", to:"posts#downvote"
 	end
 	resources :comments
 end


 
  root 'posts#index'
  get 'static_pages/home'
  get 'static_pages/help'
  resources :follows,       only: [:create, :destroy]
  
end
