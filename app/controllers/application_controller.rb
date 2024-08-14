class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_users_path
    elsif resource.ingeniero?
      availabilities_path
    else
      root_path
    end
  end
end
