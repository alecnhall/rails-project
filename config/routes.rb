Rails.application.routes.draw do

  resources :items, only: [:new, :create, :edit, :update]
  resources :users do 
    resources :recipes, only: [:new, :create, :show, :edit, :update]
  end
  resources :recipes, only: [:index, :create, :show, :edit]
  
  get 'sessions/new'
  post 'sessions/create'
  delete 'sessions/destroy'
  root 'welcome#home'

end
