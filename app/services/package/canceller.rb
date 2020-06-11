# frozen_string_literal: true

# app/services/package/canceller.rb
class Package
  class Canceller
    def self.call(id)
      package = Package.find_by(id: id)
      if package.new_delivery_status? ||
         package.processing_delivery_status?
        package.cancelled_delivery_status!
      end
    end
  end
end
