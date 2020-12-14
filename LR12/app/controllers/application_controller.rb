class ApplicationController < ActionController::Base
  before_action :authenticate

  def current_user
    @_current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id])
  end

  private

  def authenticate
    unless current_user
      redirect_to signin_path
    end
  end
end
