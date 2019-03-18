Rails.application.routes.draw do
  devise_for :users

  get 'users/courses/:id', to: 'users#my_courses', as: 'mycourses'
  get 'subcategories/index'

  resources :users, only: [:show]
  resources :courses

  resources :categories do
    resources :subcategories
  end

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
