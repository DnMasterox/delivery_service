# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :couriers   do
    resources :packages do
      member do
        patch :complete
      end
    end
  end
  root 'couriers#index'
end
