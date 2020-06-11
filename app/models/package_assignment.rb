# frozen_string_literal: true

# class PackageAssignment
class PackageAssignment < ApplicationRecord
  belongs_to :package
  belongs_to :courier

  validate :check_package_status
  after_save :change_package_status

  private

  def check_package_status
    return if package.processing_delivery_status?

    errors.add(:package, I18n.t('active_admin.package_assignments.messages.error'))
  end

  def change_package_status
    package.update(delivery_status: :assigned)
  end
end
