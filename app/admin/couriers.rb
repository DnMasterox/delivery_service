# frozen_string_literal: true

ActiveAdmin.register Courier do
  permit_params :name, :email, :password, :password_confirmation, :validity, :image, packages: []

  index do
    selectable_column
    column :name
    column :email
    column :packages
    column :image do |c|
      image_tag url_for(c.image), size: "100x100" if c.image.attached?
    end
    column 'Valid', :validity
    actions
  end
  show do
    attributes_table do
      row :image do |c|
        image_tag url_for(c.image), size: "200x200" if c.image.attached?
      end
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

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :image, as: :file
    end
    f.actions
  end
end
