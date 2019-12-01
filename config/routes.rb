Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'ads#index', as: 'home'
  resource :profile
  resources :ads do
    get "show_user_ads", on: :collection
  end

end
