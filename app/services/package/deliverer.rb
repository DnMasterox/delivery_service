# frozen_string_literal: true

# app/services/package/deliverer.rb
class Package
  class Deliverer
    def initialize(confirmation_token)
      @confirmation_token = confirmation_token
    end

    def call
      package.delivered_delivery_status! if package && package.confirmation_expiration >= Time.current
    end

    def package
      @package ||= Package.assigned_delivery_status.find_by(confirmation_token: @confirmation_token)
    end

    def success?
      package&.delivered_delivery_status?
    end
  end
end
