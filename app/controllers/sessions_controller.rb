class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by! email: auth_hash['info']['email']
    session[ :user_id ] = user.id
    redirect_to auth_hash['omniauth.origin'] || protected_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
