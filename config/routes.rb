Rails.application.routes.draw do
  devise_for :users
  get 'applications' => 'adoption_application#index'
  root 'status#index'
end
