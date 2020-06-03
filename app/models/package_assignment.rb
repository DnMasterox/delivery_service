# frozen_string_literal: true

# class PackageAssignment
class PackageAssignment < ApplicationRecord
  belongs_to :package
  belongs_to :courier
end
