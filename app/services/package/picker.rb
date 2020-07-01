# frozen_string_literal: true

# app/services/package/picker.rb
class Package
  class Picker
    def initialize(id)
      @id = id
    end

    def call
      package&.pickuped_delivery_status!
    end

    def package
      @package ||= Package.assigned_delivery_status.find_by(id: @id)
    end

    def success?
      package&.pickuped_delivery_status?
    end
  end
end
