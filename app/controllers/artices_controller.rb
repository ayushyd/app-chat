class ArticesController < ApplicationController
  load_and_authorize_resource
  before_action :set_artice, only: %i[ show edit update destroy ]
  # GET /artices or /artices.json
  def index
    @artices = @current_user.artices
  end

  # GET /artices/1 or /artices/1.json
  def show
  end

  # GET /artices/new
  def new
    @artice = Artice.new
  end

  # GET /artices/1/edit
  def edit
  end

  # POST /artices or /artices.json
  def create
    @artice = Artice.new(artice_params) 
    respond_to do |format|
      @artice&.user = current_user 
      if @artice.save
        UserMailer.new_article_notification(@artice).deliver_now
        format.html { redirect_to artice_url(@artice), notice: "Artice was successfully created." }
        format.json { render :show, status: :created, location: @artice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @artice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artices/1 or /artices/1.json
  def update
    respond_to do |format|
      if @artice.update(artice_params)
        UserMailer.new_article_notification(@artice).deliver_now
        format.html { redirect_to artice_url(@artice), notice: "Artice was successfully updated." }
        format.json { render :show, status: :ok, location: @artice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artices/1 or /artices/1.json
  def destroy
    @artice.destroy!

    respond_to do |format|
      format.html { redirect_to artices_url, notice: "Artice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artice
      @artice = Artice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artice_params
      params.require(:artice).permit(:title, :body)
    end
end
