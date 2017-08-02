Rails.application.routes.draw do

    devise_for :users
	resources :gyms do
		resources :reviews
	end
	root 'gyms#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


#get '/categories/:id' => 'gyms#category', as: "category". Not necessary anymore