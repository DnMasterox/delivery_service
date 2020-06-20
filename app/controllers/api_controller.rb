# frozen_string_literal: true

# app/controllers/api_controller.rb
class ApiController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  private

  def not_found
    render file: Rails.root.join('/public/404'), layout: false, status: :not_found
  end

  def validation_failed(entity)
    render json: { errors: entity.errors }, status: :unprocessable_entity
  end
end
