Rails.application.routes.draw do
  resources :events
  root 'application#home'

  devise_for :users, controllers: {
      sessions: 'users/sessions', registrations: 'users/registrations'
  }
  devise_scope :user do
    get "/users" => 'users/registrations#index'
    get "/users/:id/edit" => 'users/registrations#edit', as: 'edit_user'
    put "/users/:id/edit" => 'users/registrations#update', as: 'update_user'
    delete "users/:id/delete" => 'users/registrations#delete', as: 'delete_user'
  end

  resource :calendar, only: [:show], controller: :calendar
end
