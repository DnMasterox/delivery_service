# frozen_string_literal: true

# class Courier
class Courier < ApplicationRecord
  has_many :packages, dependent: :destroy
end
