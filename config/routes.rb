# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine, at: '/swagger'
  mount Rswag::Api::Engine, at: '/swagger'
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      mount_devise_token_auth_for 'Courier',
                                  at: 'auth'
      resources :couriers
      resources :packages do
        member do
          get 'generate_confirmation'
        end
      end
      resources :confirmations, only: %i[show]
    end
  end
  root to: 'admin/dashboard#index'
  devise_for :delivery_managers, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
