# frozen_string_literal: true

# app/policies/package_assignment_policy.rb
class PackageAssignmentPolicy < ApplicationPolicy
  def index?
    enabled_delivery_manager?
  end

  def create?
    enabled_delivery_manager?
  end

  def show?
    enabled_delivery_manager?
  end

  def new?
    create?
  end

  def update?
    enabled_delivery_manager?
  end

  def edit?
    update?
  end

  def destroy?
    enabled_delivery_manager?
  end
end
