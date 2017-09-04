class Users::SessionsController < Devise::SessionsController
  #before_action :configure_sign_in_params, only: [:create]

  ##
  # GET /resource/sign_in
  #
  def new
    cookies.signed[:user_id] = nil
    @user = User.new
  end

  # POST /resource/sign_in
  #
  # Session is created when a user clicks "Log In".
  # Updated 06/17/2016'
  #
  # Devise session_controller#create method
  # references the current user so we can access
  # @current_user in the home page (events_path) events/index.html
  def create
    super
  end

  ##
  # DELETE /resource/sign_out
  #
  # Reset the user_id as nil so the connection
  # to any web-socket is no longer permitted and
  # actioncable will stop attempting to connect to the previous logged in user.
  # (current_websocket_user_id = nil)
  def destroy
    cookies.signed[:user_id] = nil
    super
  end


  # protected
  #   # If you have extra params to permit, append them to the sanitizer.
  #   def permit_sign_in_params
  #     devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  #   end
end
