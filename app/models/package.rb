# frozen_string_literal: true

# class Package
class Package < ApplicationRecord
  has_many :package_assignments, dependent: :destroy
  has_many :couriers, through: :package_assignments

  before_create :set_tracking_number
  enum delivery_status: {
    new: 0,
    processing: 1,
    delivered: 2,
    cancelled: 3,
    assigned: 4
  }, _suffix: true

  def to_s
    tracking_number
  end

  private

  def set_tracking_number
    tracking_number = "YA#{8.times.map { rand(10) }.join}AA"
    if Package.exists?(tracking_number: tracking_number)
      set_tracking_number
    else
      self.tracking_number = tracking_number
    end
  end
end
