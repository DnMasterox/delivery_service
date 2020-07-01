# frozen_string_literal: true

module Api
  module V1
    class ConfirmationsController < ApiController
      # PUT /confirmations/1.json
      def show
        service = Package::Deliverer.new(params[:id])
        if !service.package
          not_found
        else
          @package = service.package
          service.call
          validation_failed(@package) unless service.success?
        end
      end
    end
  end
end
