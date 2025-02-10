Rails.application.routes.draw do
  devise_for :users
  resources :tasks, except: :show
  resources :classrooms, only: [:index, :show]
  root "tasks#index"
end
