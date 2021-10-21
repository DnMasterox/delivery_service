# frozen_string_literal: true

ActiveAdmin.register Courier do
  permit_params :name, :email, :password, :password_confirmation, :validity, packages: []

  index do
    selectable_column
    column :name
    column :email
    column :packages
    column 'Valid', :validity
    # column "Image" do |courier|
    #   image_tag(courier.avatar,width:100,height:80)
    # end
    column do
      input :avatar, as: :file
    end
    #image_column 'Document', :avatar, style: :thumb
    actions
  end
  show do
    attributes_table do
      row "Image" do |courier|
        image_tag(courier.avatar,width:100,height:80)
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

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.inputs "avatar" do
        f.input :avatar, as: :file
      end
    end
    f.actions
  end
end
