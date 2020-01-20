Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'persons#get_person'
  resources :persons do
  	post :login, on: :collection
  	get :get_person, on: :collection
  	get :search, on: :collection
    resources :vehicles
  end
end
