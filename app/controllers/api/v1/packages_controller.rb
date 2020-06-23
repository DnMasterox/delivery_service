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

      # PATCH/PUT /packages/1.json
      def update
        service = Package::Picker.new(params[:id])
        if !service.package
          not_found
        else
          @package = service.package
          service.call
          validation_failed(@package) unless service.success?
        end
      end

      def destroy
        service = Package::DePicker.new(params[:id])
        if !service.package
          not_found
        else
          service.call
          service.success? ? head(:ok) : validation_failed(service.package)
        end
      end
    end
  end
end
