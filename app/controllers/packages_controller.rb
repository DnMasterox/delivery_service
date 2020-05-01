# frozen_string_literal: true

# class PackagesController
class PackagesController < ApplicationController
  before_action :set_courier
  before_action :set_package, except: [:create]

  def create
    @package = @courier.packages.create(package_params)
    redirect_to @courier
  end

  def destroy
    @package = @courier.packages.find(params[:id])
    if @package.destroy
      flash[:success] = "Package #{@package.tracking_number} was deleted."
    else
      flash[:error] = "Package #{@package.tracking_number}
could not be deleted."
    end
    redirect_to @courier
  end

  def complete
    @package.update_attribute(:completed_at, Time.now)
    @package.update_attribute(:delivery_status, TRUE)
    redirect_to @courier, notice: "Delivery status 'Completed'"
  end

  private

  def set_courier
    @courier = Courier.find(params[:courier_id])
  end

  def set_package
    @package = @courier.packages.find(params[:id])
  end

  def package_params
    params[:package].permit(:tracking_number, :delivery_status)
  end
end
