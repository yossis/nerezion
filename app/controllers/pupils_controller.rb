class PupilsController < ApplicationController
  before_action :set_pupil, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, only: [:index]

  # GET /pupils
  # GET /pupils.json
  def index
    @pupils = Pupil.all
  end

  # GET /pupils/1
  # GET /pupils/1.json
  def show
  end

  # GET /pupils/new
  def new
    @pupil = Pupil.new
  end

  # GET /pupils/1/edit
  def edit
  end

  # POST /pupils
  # POST /pupils.json
  def create
    if pupil_params[:id].present?
      @pupil = Pupil.find(pupil_params[:id])
      @pupil.assign_attributes(pupil_params)
    else
      @pupil = Pupil.new(pupil_params)
    end
    @pupil.is_registered = true

    respond_to do |format|
      if @pupil.is_valid_phone?(pupil_params[:phone]) && @pupil.save
        PupilMailer.welcome(@pupil.id).deliver_later if @pupil.email.present?
        SystemMailer.welcome(@pupil).deliver_later
        flash[:success] = true
        cookies.signed[:pupil] = { value: @pupil.id, expires: 1.year.from_now }
        format.html { redirect_to @pupil, notice: 'Pupil was successfully created.' }
        format.json { render :show, status: :created, location: @pupil }
        format.js
      else
        format.html { render :new }
        format.json { render json: @pupil.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /pupils/1
  # PATCH/PUT /pupils/1.json
  def update
    respond_to do |format|
      if @pupil.update(pupil_params)
        format.html { redirect_to @pupil, notice: 'Pupil was successfully updated.' }
        format.json { render :show, status: :ok, location: @pupil }
      else
        format.html { render :edit }
        format.json { render json: @pupil.errors, status: :unprocessable_entity }
      end
    end
  end

  def invite
      @pupil = Pupil.find(params[:hidden_pupil_id])
    if @pupil.present? && @pupil.is_valid_phone?(params[:invited_phone])
      @pupil.invited_phone = params[:invited_phone]
      @pupil.is_invited = true
      #@pupil.invited_by = current_user.id
      if @pupil.save(validate: false)
        SmsJob.perform_later @pupil.id
      end

      @no_details1 = Pupil.where(email: nil, phone: nil, class_name: '1').all
      @no_details2 = Pupil.where(email: nil, phone: nil, class_name: '2')
      @no_details3 = Pupil.where(email: nil, phone: nil, class_name: '3')

    end
  end

  # DELETE /pupils/1
  # DELETE /pupils/1.json
  def destroy
    @pupil.destroy
    respond_to do |format|
      format.html { redirect_to pupils_url, notice: 'Pupil was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pupil
      @pupil = Pupil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pupil_params
      params.require(:pupil).permit(:id, :first_name, :last_name, :madien_name, :class_name, :email, :phone, :is_coming, :is_registered, :is_teacher)
    end
end
