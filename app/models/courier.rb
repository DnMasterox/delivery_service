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
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' },
                             default_url: '/images/:style/missing.png'
  do_not_validate_attachment_file_type :avatar

  def self.find_for_authentication(tainted_conditions)
    find_first_by_auth_conditions(tainted_conditions, validity: true)
  end
end
