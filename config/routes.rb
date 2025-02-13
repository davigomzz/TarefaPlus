Rails.application.routes.draw do
  devise_for :users
  resources :tasks
  resources :classrooms, only: [:index, :show]
  root "tasks#index"
  resources :task_students
end
