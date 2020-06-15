# frozen_string_literal: true

# app/controllers/api_controller.rb
class ApiController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
end
