# frozen_string_literal: true

json.packages @packages do |package|
  json.extract! package, :id, :estimated_delivery_date, :tracking_number
end
