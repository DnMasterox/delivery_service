# frozen_string_literal: true

json.extract! @package, :tracking_number, :delivery_status,
              :estimated_delivery_date, :confirmation_token,
              :confirmation_expiration
