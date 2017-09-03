Rails.application.routes.draw do
  get 'sessions/new'
  # get 'users/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session

  devise_for :users
  get 'users/index'

  root 'application#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # devise_for :users, skip: [:sessions]
  # as :user do
  #   # get 'signin', to: 'devise/sessions#new', as: :new_user_session
  #   # post 'signin', to: 'devise/sessions#create', as: :user_session
  #   delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  # end


  #
  # new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
  # user_session POST   /users/sign_in(.:format)       devise/sessions#create
  # destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
end
