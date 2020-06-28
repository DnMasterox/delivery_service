# frozen_string_literal: true

ActiveAdmin.register Package do
  permit_params :tracking_number, :delivery_status, :estimated_delivery_date,
                couriers: []

  index do
    selectable_column
    column :tracking_number
    tag_column :delivery_status
    column :estimated_delivery_date
    column :couriers
    actions
  end

  form do |f|
    f.inputs do
      f.input :estimated_delivery_date, as: :date_time_picker
      f.input :delivery_status, as: :select, include_blank: false
    end
    f.actions
  end
  controller do
    def destroy
      if Package::Canceller.call(params[:id])
        flash[:success] = I18n.t('active_admin.resources.package.messages.success')
      else
        flash[:error] = I18n.t('active_admin.resources.package.messages.error')
      end
      redirect_back fallback_location: active_admin_root
    end
  end
end
