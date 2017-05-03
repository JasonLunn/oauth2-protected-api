class ProtectedController < ApplicationController
  before_action :authorize
  def index
  end

  private
  def authorize
    unless session.include? :user_id
      redirect_to "/auth/google_oauth2"
    end
  end
end
