# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :couriers   do
    resources :packages do
      member do
        patch :complete
      end
    end
  end
  root 'couriers#index'
end
