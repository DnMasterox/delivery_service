# frozen_string_literal: true

Rswag::Ui.configure do |c|
  c.swagger_endpoint '/swagger/v1/swagger.yaml', 'Docs'
  c.swagger_endpoint '/swagger/v1/swagger_admin_doc.yaml', 'Admin Docs Internal'
end
