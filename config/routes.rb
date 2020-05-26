# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'admin/dashboard#index'

  devise_for :delivery_managers, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :couriers   do
    resources :packages do
      member do
        patch :complete
      end
    end
  end
end
