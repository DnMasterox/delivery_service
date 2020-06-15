# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
#
# Examples:
Courier.create!(name: 'Test',
                email: 'test@test.test',
                password: 'password',
                password_confirmation: 'password')
AdminUser.create!(email: 'admin@example.com',
                  password: 'password',
                  password_confirmation: 'password') if Rails.env.development?
DeliveryManager.create!(email: 'deliverymanager@example.com',
                  password: 'password',
                  password_confirmation: 'password')

