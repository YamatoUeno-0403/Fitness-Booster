# frozen_string_literal: true

Rails.application.routes.draw do
  resources :videos
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations',
  }

  scope module: :customers do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    resources :posts do
      resources :post_comments, only: %i(create destroy)
      resource :favorites, only: %i(create destroy)
      resource :muscles, only: %i(create destroy)
    end

    resources :customers do
      resource :relationships, only: %i(create destroy)
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

    get 'search' => 'searches#index'
    resources :maps, only: [:index]
  end

  devise_for :admins, skip: [:registrations], controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
  }

  namespace :admins do
    resources :customers
    resources :posts
  end
end
