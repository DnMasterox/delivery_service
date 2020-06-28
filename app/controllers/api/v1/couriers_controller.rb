# frozen_string_literal: true

# class CouriersController
module Api
  module V1
    class CouriersController < CouriersApiController
      def show
        @courier = Package.find_by(id: courier_params[:id])
        if @courier
          render json: @courier
        else
          not_found
        end
      end

      def update
        @courier = Courier.find_by(id: params[:id])
        if !@courier
          not_found
        elsif @courier.avatar.blank?
          @courier.update(courier_params)
        else
          validation_failed(@courier)
        end
      end

      private

      def courier_params
        params.permit(:email, :password, :avatar, :id)
      end
    end
  end
end
