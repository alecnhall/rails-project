Rails.application.routes.draw do
  resources :users
  get 'sessions/new'
  post 'sessions/create'
  delete 'sessions/destroy'
  root 'welcome#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
