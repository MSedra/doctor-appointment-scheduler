class DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[ show edit update destroy ] 
  #before_action :authenticate_user!, only: %i[:book_appointment]

  # GET /doctors or /doctors.json
  def index

    if params[:city] and params[:city]=="All Cities"
      params[:city] = nil
    end
    
    if params[:speciality] and params[:speciality]=="All Specialities" 
      params[:speciality] = nil
    end  
    @doctors = Doctor.where("city like ? and speciality like ? and name like ?", "#{params[:city]}%", "#{params[:speciality]}%", "#{params[:name]}%")
   
  end

  # GET /doctors/1 or /doctors/1.json
  def show
    @appointments = Appointment.where(doctor_id: @doctor.id).order(starting_time: :asc)
  end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
  end

  # GET /doctors/1/edit
  def edit
  end

  # POST /doctors or /doctors.json
  def create
    @doctor = Doctor.new(doctor_params)

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to doctor_url(@doctor), notice: "Doctor was successfully created." }
        format.json { render :show, status: :created, location: @doctor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctors/1 or /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to doctor_url(@doctor), notice: "Doctor was successfully updated." }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1 or /doctors/1.json
  def destroy
    @doctor.destroy

    respond_to do |format|
      format.html { redirect_to doctors_url, notice: "Doctor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def book_appointment 
    flash.now[:notice] = 'Message sent!'
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def doctor_params
      params.require(:doctor).permit(:name, :speciality, :city, :price_per_visit, :appointment_id)
    end
end
