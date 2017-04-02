class NotInListsController < ApplicationController
  before_action :set_not_in_list, only: [:show, :edit, :update, :destroy]

  # GET /not_in_lists
  # GET /not_in_lists.json
  def index
    @not_in_lists = NotInList.all
  end

  # GET /not_in_lists/1
  # GET /not_in_lists/1.json
  def show
  end

  # GET /not_in_lists/new
  def new
    @not_in_list = NotInList.new
  end

  # GET /not_in_lists/1/edit
  def edit
  end

  # POST /not_in_lists
  # POST /not_in_lists.json
  def create
    @not_in_list = NotInList.new(not_in_list_params)

    respond_to do |format|
      if @not_in_list.is_valid_phone?(not_in_list_params[:phone_number]) && @not_in_list.save
        flash[:success] = true
        #PupilMailer.welcome(@pupil.id).deliver_later
        format.html { redirect_to @not_in_list, notice: 'Not in list was successfully created.' }
        format.json { render :show, status: :created, location: @not_in_list }
        format.js
      else
        format.html { render :new }
        format.json { render json: @not_in_list.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /not_in_lists/1
  # PATCH/PUT /not_in_lists/1.json
  def update
    respond_to do |format|
      if @not_in_list.update(not_in_list_params)
        format.html { redirect_to @not_in_list, notice: 'Not in list was successfully updated.' }
        format.json { render :show, status: :ok, location: @not_in_list }
      else
        format.html { render :edit }
        format.json { render json: @not_in_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /not_in_lists/1
  # DELETE /not_in_lists/1.json
  def destroy
    @not_in_list.destroy
    respond_to do |format|
      format.html { redirect_to not_in_lists_url, notice: 'Not in list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_not_in_list
      @not_in_list = NotInList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def not_in_list_params
      params.require(:not_in_list).permit(:full_name, :phone_number, :email, :class_name, :is_teacher)
    end
end
