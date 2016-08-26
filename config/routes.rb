Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }
namespace :api do
	namespace :v1 do
		resources :users, except: [:new, :edit],defaults: { format: :json }
end
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
