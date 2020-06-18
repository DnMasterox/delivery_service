# frozen_string_literal: true

# app/controllers/api/couriers_api_controller.rb
class CouriersApiController < ApiController
  before_action :authenticate_api_v1_courier!
end
