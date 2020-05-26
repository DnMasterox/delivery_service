# frozen_string_literal: true

# class DeliveryManager
class DeliveryManager < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  def self.find_for_authentication(tainted_conditions)
    find_first_by_auth_conditions(tainted_conditions, enabled: true)
  end
end
