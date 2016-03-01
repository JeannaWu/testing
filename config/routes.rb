Rails.application.routes.draw do
  resources :search_suggestions
  devise_for :users
  resources :users do
    member do
    get :follow
    get :unfollow
    get :following, :followers
    get :joining
end
end



  resources :clubs do
    member do
    get :follow
    get :unfollow

end
  end
  

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
  resources :follows
  
end
