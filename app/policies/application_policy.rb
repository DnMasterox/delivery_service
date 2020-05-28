# frozen_string_literal: true

# class ApplicationPolicy
class ApplicationPolicy
  # class Scope
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  private

  def enabled_delivery_manager?
    user.instance_of?(DeliveryManager) && user.enabled?
  end
end
