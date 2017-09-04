class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  ##
  # If a user is not authorized for an action then they
  # will be redirected to their root_path
  rescue_from "AccessGranted::AccessDenied" do #|exception|
    redirect_to root_path, alert: I18n.t(:pg_access_denied_msg)
  end

  ##
  # If the user is signed in then they are redirected to their main page,
  # otherwise they will be prompted with the devise login page.
  def home
    if user_signed_in?
      # set user id in cookies in order for action cable websockets authorized connection setup
      cookies.signed[:user_id] = @current_user.id
      redirect_to users_path
    else
      cookies.signed[:user_id] = nil
      redirect_to new_user_session_path
    end
  end

  ##
  # Gathers all object errors when at least one field is invalid.
  def obj_error_msgs(object)
    display_message = ""
    object.errors.full_messages.each do |el|
      display_message += el
      display_message += ". "
    end
    display_message
  end

  ##
  # Permits *args as parameters along with sortable parameters.
  def permit_params_with_sortable(*args)
    params.permit(:direction, :sort, *args).to_h
  end
end
