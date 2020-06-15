# frozen_string_literal: true

# class Courier
class Courier < ApplicationRecord
  extend Devise::Models
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :package_assignments, dependent: :destroy
  has_many :packages, through: :package_assignments
end
