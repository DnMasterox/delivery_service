# frozen_string_literal: true

# class PackagesController
module Api
  module V1
    class PackagesController < ApiController
      before_action :authenticate_courier!
    end
  end
end
