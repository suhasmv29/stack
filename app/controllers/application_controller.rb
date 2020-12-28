class ApplicationController < ActionController::Base
  def require_user
    redirect_to root_path unless user_signed_in?
  end
end
