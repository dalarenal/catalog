class ApplicationController < ActionController::API
  private

  def current_user
    # Fake user session
    @user ||= User.first
  end
end
