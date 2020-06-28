# frozen_string_literal: true

# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  include Paperclip::Glue
  protect_from_forgery except: :sign_in
end
