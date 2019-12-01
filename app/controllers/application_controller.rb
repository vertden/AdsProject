class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = t("access_denied")
    redirect_to home_path
  end
end
