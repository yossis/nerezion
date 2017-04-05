class MemorialsController < ApplicationController
  before_action :set_memorial, only: [:show, :edit, :update, :destroy]
  before_action :set_memorial_sender, only: [:update]

  # GET /memorials
  # GET /memorials.json
  def index
    @memorials = Memorial.all
  end

  # GET /memorials/1
  # GET /memorials/1.json
  def show
  end

  # GET /memorials/new
  def new
    @memorial = Memorial.new
  end

  # GET /memorials/1/edit
  def edit
  end

  # POST /memorials
  # POST /memorials.json
  def create
    @memorial = Memorial.new(memorial_params)
    @memorial.pupil_id_sender = current_user.id

    respond_to do |format|
      if @memorial.save
        SystemMailer.created_memorial(@memorial).deliver_later
        load_params_for_reload_page
        format.html { redirect_to @memorial, notice: 'Memorial was successfully created.' }
        format.json { render :show, status: :created, location: @memorial }
        format.js
      else
        format.html { render :new }
        format.json { render json: @memorial.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /memorials/1
  # PATCH/PUT /memorials/1.json
  def update
    respond_to do |format|
      if @memorial.update(memorial_params)
        load_params_for_reload_page
        format.html { redirect_to @memorial, notice: 'Memorial was successfully updated.' }
        format.json { render :show, status: :ok, location: @memorial }
        format.js { render :create}
      else
        format.html { render :edit }
        format.json { render json: @memorial.errors, status: :unprocessable_entity }
        format.js { render :create}
      end
    end
  end

  # DELETE /memorials/1
  # DELETE /memorials/1.json
  def destroy
    SystemMailer.destoryed_memorial(@memorial.id).deliver_later
    @memorial.destroy
    respond_to do |format|
      format.html { redirect_to memorials_url, notice: 'Memorial was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memorial
      @memorial = Memorial.find(params[:id])
    end

    def set_memorial_sender
      @memorial.pupil_id_sender = current_user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def memorial_params
      params.require(:memorial).permit(:book_id, :pupil_id_sender, :pupil_id_reciver, :content)
    end

    def load_params_for_reload_page
      @book = current_user.book
      @pupils = Pupil.all
      current_user.association(:memorials_sender).add_to_target(Memorial.new)
      #code
    end
end
