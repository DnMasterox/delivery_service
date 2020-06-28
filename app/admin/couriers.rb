# frozen_string_literal: true

ActiveAdmin.register Courier do
  permit_params :name, :email, :password, :password_confirmation, :validity, packages: []

  index do
    selectable_column
    column :name
    column :email
    column :packages
    column 'Valid', :validity
    image_column 'Document', :avatar, style: :thumb
    actions
  end
  show do
    attributes_table do
      image_row 'Document', :avatar
      table_for courier do
        toggle_bool_column 'Valid', :validity
      end
    end
    panel 'Courier info' do
      table_for courier do
        column :name
        column :email
        column :packages
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
