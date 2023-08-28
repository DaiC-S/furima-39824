class ApplicationController < ActionController::Base
  before_action :basic_authentication

  def basic_authentication
    authenticate_or_request_with_http_basic do |username, password|
      username == 'daichi' && password == 'dddd'
    end
  end
end
