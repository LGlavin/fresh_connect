FreshConnect::Application.routes.draw do
 
  
resources :markets do
  resources :reviews
  resources :recommendations
end
  


  root 'welcome#index'
  devise_for :users
end