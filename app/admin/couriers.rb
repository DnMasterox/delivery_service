# frozen_string_literal: true

ActiveAdmin.register Courier do
  permit_params :name, :email, packages: []

  index do
    selectable_column
    column :name
    column :email
    column :packages
    actions
  end
  form do |f|
    f.inputs do
      f.input :name
      f.input :email
    end
    f.actions
  end
end
