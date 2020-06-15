# frozen_string_literal: true

# class CouriersController
module Api
  module V1
    class CouriersController < ApiController
      before_action :authenticate_courier!
      def index
        render json: courier_signed_in?
      end
    end
  end
end
