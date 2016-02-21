Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/home'

  get 'static_pages/help'

 resources :posts do
 	member do
 		get "like", to:"posts#upvote"
 		get "dislike", to:"posts#downvote"
 	end
 	resources :comments
 end
  root 'posts#index'
end
