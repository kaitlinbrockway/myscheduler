class Users::RegistrationsController < Devise::RegistrationsController
  # Skip authentication for the following actions in order to allow users to update
  # other users while signed in with their own account.
  skip_before_action :require_no_authentication, only: [:new, :create, :update]

  def index
    authorize! :read, User
    params = permit_params_with_sortable
    @users = User.all.select(:id, :first_name, :last_name, :email, :role).sort_by &:first_name
    # TODO: Add sortable columns
  end

  ##
  # GET /resource/sign_up
  #
  # Method utilized for when a user is registering
  # a new account or when a user is registering a new
  # user account for a different user when logged in.
  def new
    authorize! :create, User
    @user = User.new
    new_user_params
  end

  ##
  # POST /resource
  #
  # Action called upon clicking "sign up" on the sign_up
  # page (new user registration page)
  #
  # Creates a new user or returns an error message.
  def create
    authorize! :create, User
    u_params = user_params
    @user = User.new(u_params.symbolize_keys)
    if @user.save
      # current_user will be present if a user is logged in
      # TODO: Capitalize first and last name before saving
      redirect_to users_path(), :flash => { :notice => "#{@user.first_name} #{@user.last_name} was #{I18n.t(:create_success_msg)}" }
    else
      #TODO:  display_message = obj_error_msgs(@user)
      redirect_to new_user_registration_path(), :flash => { :danger => "New user could not be registered. Please correct invalid form fields." }
    end
  end

  def edit
    authorize! :update, User
    super
  end

  def update
    authorize! :update, User
    params.permit(:first_name, :last_name, :role)
    super
  end

  ##
  # DELETE /resource
  #
  def destroy
    authorize! :destroy, @user
    @user = User.find(params[:id])
    # TODO: make sure this is not self
    @user.destroy
    # TODO: Render with flash message
  end

  ##
  # Permit the usage of parameters supplied in the contact form related to the
  # user itself.
  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email, :password, :current_password, :password_confirmation, :role).to_h
  end

#TODO: based on what types of user roles this user can create?
  def new_user_params
    # params.require(:user).permit(:id)
  end
end