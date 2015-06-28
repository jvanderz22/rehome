Rails.application.routes.draw do
  root 'status#index'

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'user'
    resources :adoption_applications, :only => [:index, :show, :create]
  end
end
