Rails.application.routes.draw do
  devise_for :users

  get 'users/courses/:id', to: 'users#my_courses', as: 'mycourses'

  resources :users, only: [:show]
  resources :courses

  resources :categories
  resources :subcategories
  resources :subsubcategories

  namespace :api do
    namespace :v1 do
      resource :courses, only: [:index, :create, :destroy, :update, :show]
      resource :categories, only: [:index, :create, :destroy, :update, :show]
      resource :subcategories, only: [:index, :create, :destroy, :update, :show]
      resource :subsubcategories
    end
  end

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
