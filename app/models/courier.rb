# frozen_string_literal: true

# class Courier
class Courier < ApplicationRecord
  has_many :package_assignments, dependent: :destroy
  has_many :packages, through: :package_assignments
end
