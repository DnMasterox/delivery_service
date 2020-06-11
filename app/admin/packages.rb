# frozen_string_literal: true

ActiveAdmin.register Package do
  permit_params :tracking_number, :delivery_status, :estimated_delivery_date,
                couriers: []

  index do
    selectable_column
    column :tracking_number
    column :delivery_status
    column :estimated_delivery_date
    column :couriers
    actions
  end

  form do |f|
    f.inputs do
      f.input :estimated_delivery_date
      f.input :delivery_status, as: :select, include_blank: false
    end
    f.actions
  end
end
