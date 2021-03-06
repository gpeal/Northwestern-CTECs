class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :landing_redirect

  helper_method :subjects

  def subjects
    @subjects ||= Subject.all.sort_by(&:name)
  end

  # Redirect the user to the landing page if they are not logged in
  def landing_redirect
    redirect_to welcome_path unless user_signed_in?
  end
end
