class AppointmentsController < ApplicationController
  before_action :authenticate_user

  def show 
    @my_appointments = Appointment.where(user_id: current_user.id).order(starting_time: :asc)
  end

  private 
    def authenticate_user
      if not user_signed_in?
        redirect_to new_user_session_path, :notice => 'Please Log in to continue'
      end
    end   
end
