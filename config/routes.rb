# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }

  scope module: :customers do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    resources :posts do
      resources :post_comments, only: %i[create destroy]
      resource :favorites, only: %i[create destroy]
      resource :muscles, only: %i[create destroy]
    end

    resources :customers
  end
end
