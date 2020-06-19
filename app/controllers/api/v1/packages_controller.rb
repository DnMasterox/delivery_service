# frozen_string_literal: true

# class PackagesController
module Api
  module V1
    class PackagesController < ApiController
      before_action :authenticate_api_v1_courier!
      # GET /packages.json
      def index
        @packages = Package.assigned_delivery_status
      end

      # GET /packages/uuid
      def show
        @package = Package.find_by(id: params[:id])
        if @package
          render json: @package
        else
          not_found
        end
      end
    end
  end
end
