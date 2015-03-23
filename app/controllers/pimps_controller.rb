class PimpsController < ApplicationController
  before_action :set_pimp, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index]

  # GET /pimps
  # GET /pimps.json
  def index
    @pimps = Pimp.order("created_at desc")
  end

  # GET /pimps/1
  # GET /pimps/1.json
  def show
  end

  # GET /pimps/new
  def new
    @pimp = current_user.pimps.new
  end

  # GET /pimps/1/edit
  def edit
  end

  # POST /pimps
  # POST /pimps.json
  def create
    @pimp = current_user.pimps.new(pimp_params)

    respond_to do |format|
      if @pimp.save
        format.html { redirect_to pimps_url, notice: 'Pimp was successfully created.' }
        format.json { render :show, status: :created, location: @pimp }
      else
        format.html { render :new }
        format.json { render json: @pimp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pimps/1
  # PATCH/PUT /pimps/1.json
  def update
    respond_to do |format|
      if @pimp.update(pimp_params)
        format.html { redirect_to pimps_url, notice: 'Pimp was successfully updated.' }
        format.json { render :show, status: :ok, location: @pimp }
      else
        format.html { render :edit }
        format.json { render json: @pimp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pimps/1
  # DELETE /pimps/1.json
  def destroy
    @pimp.destroy
    respond_to do |format|
      format.html { redirect_to pimps_url, notice: 'Pimp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pimp
      @pimp = Pimp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pimp_params
      params.require(:pimp).permit(:user, :name, :image)
    end
end
