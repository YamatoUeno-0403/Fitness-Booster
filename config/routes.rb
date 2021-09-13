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
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create,:destroy]
    end

    resources :customers
  end
end
