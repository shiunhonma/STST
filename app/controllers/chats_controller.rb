class CahtsController < ApplicationController
  before_action :set_caht, only: %i[ show edit update destroy ]

  # GET /cahts or /cahts.json
  def index
    @cahts = Caht.all
  end

  # GET /cahts/1 or /cahts/1.json
  def show
  end

  # GET /cahts/new
  def new
    @caht = Caht.new
  end

  # GET /cahts/1/edit
  def edit
  end

  # POST /cahts or /cahts.json
  def create
    @caht = Caht.new(caht_params)

    respond_to do |format|
      if @caht.save
        format.html { redirect_to caht_url(@caht), notice: "Caht was successfully created." }
        format.json { render :show, status: :created, location: @caht }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @caht.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cahts/1 or /cahts/1.json
  def update
    respond_to do |format|
      if @caht.update(caht_params)
        format.html { redirect_to caht_url(@caht), notice: "Caht was successfully updated." }
        format.json { render :show, status: :ok, location: @caht }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @caht.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cahts/1 or /cahts/1.json
  def destroy
    @caht.destroy

    respond_to do |format|
      format.html { redirect_to cahts_url, notice: "Caht was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caht
      @caht = Caht.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def caht_params
      params.require(:caht).permit(:message, :attachment, :user_id)
    end
end
