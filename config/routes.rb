Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  get 'users/courses/:id', to: 'users#my_courses', as: 'mycourses'
  resources :courses
  resources :categories
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
