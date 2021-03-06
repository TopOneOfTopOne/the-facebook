class UsersController < ApplicationController
  def external_create
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect @user, event: :authentication
    flash[:success] = "Welcome #{@user.name}"
  end

  def show
    @user = User.find_by_id(params[:id])
  end
end
