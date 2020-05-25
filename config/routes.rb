Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'searches#new'
  resources :persons do
  	post :login, on: :collection
  	get :get_person, on: :collection
  	get :search, on: :collection
    get 'new_task' => 'tasks#new'
    resources :vehicles
  end

  resources :searches do
  	get :search_results, on: :collection
  end
end
