# frozen_string_literal: true

Rails.application.routes.draw do


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

    resources :customers do
      resource :relationships, only: %i[create destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
  end
  
    devise_for :admins, :skip =>[:registrations, :passwords],controllers: {
    sessions: 'admins/sessions',
  }
   namespace :admins do
    resources :customers
    resources :posts
  end
end
