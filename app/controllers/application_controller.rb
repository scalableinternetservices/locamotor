class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :cor
  rescue_from ActionController::InvalidAuthenticityToken, :with => :bad_token

 def bad_token
    Rails.logger.debug("session expired!")
  end


  private
  def cor
    headers["Access-Control-Allow-Origin"]  = "*"
    headers["Access-Control-Allow-Methods"] = %w{GET POST PUT DELETE}.join(",")
    headers["Access-Control-Allow-Headers"] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(",")
    head(:ok) if request.request_method == "OPTIONS"
  end
  def home
    render html: "Going to Skeddit"
  end
end
