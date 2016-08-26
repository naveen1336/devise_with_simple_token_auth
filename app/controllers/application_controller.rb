require "application_responder"

class ApplicationController < ActionController::API
  self.responder = ApplicationResponder
  respond_to :json

  acts_as_token_authentication_handler_for User, fallback_to_devise: false
before_filter :authenticate_user!  

#include ActionController::MimeResponds
#protect_from_forgery with: :null_session
end
