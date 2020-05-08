# frozen_string_literal: true

# class Package
class Package < ApplicationRecord
  belongs_to :courier

  def completed?
    !completed_at.blank?
  end
end
