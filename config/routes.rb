Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/home'

  get 'static_pages/help'

 resources :posts do
 	resources :comments
 end
  root 'posts#index'
end
