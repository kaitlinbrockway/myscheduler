class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?
  #

  # protect_from_forgery prepend: true
  #
  # include MeetingsHelper, MeetingTypesHelper
  #
  # layout :layout
  #
  # before_action :set_current_event, :add_event_crumb, :except => [:filter]
  # helper_method :sort_column, :sort_direction
  #
  # ##
  # # When a user is not authorized for an action then they
  # # will be redirected to their root_path
  # #
  # # Updated: 06/17/2016
  # rescue_from "AccessGranted::AccessDenied" do #|exception|
  #   redirect_to root_path, alert: I18n.t(:flash_access_denied)
  # end
  #
  # ##
  # # Home simply checks if the user is signed in or not and redirects to the event path based on
  # # whether or not @current_event exists, and renders the devise layout if the user
  # # is not signed in to allow for login.
  # def home
  #   if user_signed_in?
  #     #add the current user's id to cookies in order to set up
  #     #an authorized connection to the websocket.
  #     cookies.signed[:user_id] = @current_user.id
  #     redirect_to events_path
  #   else
  #     cookies.signed[:user_id] = nil
  #     redirect_to sign_in_path
  #   end
  # end
  #
  # ##
  # # Helper method for displaying object errors
  # # when fields are invalid.
  # def get_object_flash_errors(object)
  #   display_message = ""
  #   object.errors.full_messages.each do |el|
  #     display_message += el
  #     display_message += ". "
  #   end
  #   display_message
  # end
  #
  # private
  # ##
  # # Define the default layout to be used within the application. If the user is signed in the
  # # layout to be used is application, otherwise show a login screen
  # def layout
  #   user_signed_in? ? "application" : "devise"
  # end
  #
  # def add_event_crumb
  #   add_crumb @current_event.name, events_path if @current_event.present?#event_path(@current_event)
  # end
  #
  # ##
  # # If the user has selected a column
  # # to sort then the params[:sort] will be present,
  # # but if they have not then that parameter will not be present
  # # and the page will be sorted based off of the default column
  # # that was passed in as a parameter.
  # #
  # # Note in order for the page to sort based off of the params[:sort]
  # # if it is present then the model must also have a column name
  # # that is included in its column names with the same representation
  # # as the parameter passed in.
  # def sort_column(column, klass)
  #   klass.constantize.column_names.include?(params[:sort]) ? params[:sort] : column
  # end
  #
  # ##
  # # If the direction parameter exists and also exists as a match to
  # # one of the strings present in the array then the column will be sorted
  # # in that order, but if it is not then it will default to sort in ascending
  # #  order.
  # def sort_direction
  #   %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  # end
  #
  # ##
  # # Show error messages at the top of the page. Use flash.now to only display the message on the first
  # # page loaded with the flash_errors method call.
  # def flash_errors(object)
  #   object.errors.full_messages.each do |message|
  #     flash.now[message] = message
  #   end
  # end
  #
  # ##
  # # Generic method to render a form view. Any controller can call this to render a form, but the controller
  # # must have a form view or else an error will occur.
  # def render_form(object)
  #   name = object.respond_to?(:name) && object.name.present? ? object.name : object.class.to_s.titleize
  #   add_crumb "#{action_name.titleize} #{name}"
  #
  #   flash_errors object
  #   render :form
  # end
  #
  # ##
  # # Set the global variable @current_event if event information is provided via parameters, or
  # # if the event has been saved within cookies
  # #
  # # Once the current event is obtained save the ID in a cookie
  # def set_current_event
  #   # An event secret takes first priority
  #   if params[:event_secret].present?
  #     @current_event = Event.find_by_secret(params[:event_secret])
  #   else
  #     if params[:controller] == 'events'
  #       # If the controller is events then the parameter is :id
  #       id = params[:id]
  #     elsif params[:event_id].present?
  #       # All other controllers will use :event_id
  #       id = params[:event_id]
  #     elsif cookies[:event_id].present?
  #       # If the ID isn't specified within parameters check the cookies
  #       id = cookies[:event_id]
  #     end
  #
  #     if id.present?
  #       cookies[:event_id] = id
  #       begin
  #         @current_event = Event.find(id)
  #       rescue ActiveRecord::RecordNotFound
  #         @current_event = nil
  #       end
  #     end
  #   end
  # end
  #
  #
  # protected
  # ##
  # #
  # def invalid_access_request
  #   #redirect to the login page and let them know they dont have access to access this page
  #   redirect_to new_user_session_path, flash: { error: "You do not have access to reach the requested page." }
  # end
  #
  # ##
  # # Configuring devise parameters for updating an existing user.
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:account_update) {|u|
  #     u.permit(:password, :password_confirmation, :current_password, :current_email, :email, :role)
  #   }
  # end
  #
  # ##
  # # Permits the following parameters and
  # # the *args parameters passed in.
  # def permit_params_with_authentication_to_h(*args)
  #   params.permit(:utf8, :authenticity_token, :commit, *args).to_h
  # end
  #
  #
  # ##
  # # Parameters that multiple different controller index methods
  # # will permit in addition to the params passed in as *args
  # # in order to permit appropriate parameters for the sortable
  # # functionality on the index view.
  # #
  # def permit_index_params_with_sortable(*args)
  #   params.permit(:direction, :sort, *args).to_h
  # end
end
