class ApplicationController < ActionController::Base

  def authenticate_user!(*args)
    super and return unless args.blank?
    json_request? ? authenticate_api_user! : super
  end

  def json_request?
    request.format.json?
  end

  def set_current_user
    @current_user || warden.authenticate(scope: :api_user, :store => !(json_request?))
  end
end
