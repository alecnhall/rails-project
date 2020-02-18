Rails.application.routes.draw do

  resources :items, only: [:new, :create, :edit, :update]
  resources :users 
  resources :recipes
  
  get 'sessions/new'
  post 'sessions/create'
  delete 'sessions/destroy'
  root 'welcome#home'

end
