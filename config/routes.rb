Rails.application.routes.draw do
  devise_for :users

  get 'users/courses/:id', to: 'users#my_courses', as: 'mycourses'
  get 'subcategories/index'
  get 'update_sub_categories' => 'courses#update_sub_categories'

  get 'courses/update_sub_categories' => 'courses#update_sub_categories'

  resources :users, only: [:show]
  resources :courses do
    get :update_sub_categories, :on => :member
  end

  resources :categories
  resources :subcategories

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
