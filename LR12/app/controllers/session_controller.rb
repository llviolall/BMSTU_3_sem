class SessionController < ApplicationController
  skip_before_action :authenticate, only: [:new,:create]

  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Неправильный логин или пароль"
      redirect_to signin_url
    end
  end

  def destroy
    session.delete(:current_user_id)
    @_current_user=nil
    redirect_to root_path
  end
end
