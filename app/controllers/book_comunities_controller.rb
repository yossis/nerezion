class BookComunitiesController < ApplicationController
  before_action :set_book_comunity, only: [:show, :edit, :update, :destroy]

  # GET /book_comunities
  # GET /book_comunities.json
  def index
    @book_comunities = BookComunity.all
  end

  # GET /book_comunities/1
  # GET /book_comunities/1.json
  def show
  end

  # GET /book_comunities/new
  def new
    @book_comunity = BookComunity.new
  end

  # GET /book_comunities/1/edit
  def edit
  end

  # POST /book_comunities
  # POST /book_comunities.json
  def create
    @book_comunity = BookComunity.new(book_comunity_params)

    respond_to do |format|
      if @book_comunity.save
        format.html { redirect_to @book_comunity, notice: 'Book comunity was successfully created.' }
        format.json { render :show, status: :created, location: @book_comunity }
      else
        format.html { render :new }
        format.json { render json: @book_comunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_comunities/1
  # PATCH/PUT /book_comunities/1.json
  def update
    respond_to do |format|
      if @book_comunity.update(book_comunity_params)
        format.html { redirect_to @book_comunity, notice: 'Book comunity was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_comunity }
      else
        format.html { render :edit }
        format.json { render json: @book_comunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_comunities/1
  # DELETE /book_comunities/1.json
  def destroy
    @book_comunity.destroy
    respond_to do |format|
      format.html { redirect_to book_comunities_url, notice: 'Book comunity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_comunity
      @book_comunity = BookComunity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_comunity_params
      params.require(:book_comunity).permit(:pupil_id, :about_me, :photo_from_last, :photo_form_today)
    end
end
