# frozen_string_literal: true

ActiveAdmin.register PackageAssignment do
  permit_params :package_id, :courier_id
  form do |f|
    f.inputs do
      f.input :package_id,
              as: :select,
              collection: Package.where(delivery_status: 'processing'),
              include_blank: false
      f.input :courier_id,
              as: :select,
              collection: Courier.all,
              include_blank: false
    end
    f.actions
  end
end
