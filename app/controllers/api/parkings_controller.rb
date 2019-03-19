module Api
class ParkingsController < ApplicationController
  before_action :set_parking, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  respond_to :json
  def all
  end
  def default_serializer_options
    { root: false }
  end


  include RenderHelper
  # GET /parkings
  # GET /parkings.json
  def index
    @parking = Parking.all
    render_default_format(@parking,true)
  end

  # GET /parkings/1
  # GET /parkings/1.json
  def show
  end

  # GET /parkings/new
  def new
    @parking = Parking.new
    render_default_format(@parking, true)
  end

  # GET /parkings/1/edit
  def edit
  end

  # POST /parkings
  # POST /parkings.json
  def create
    @parking = Parking.new(parking_params)
    if @parking.save
      render_success_format('parking created correctly', @parking)
    end

  rescue Exception => e
    render_default_error e, 401
    e.inspect
  end

  # PATCH/PUT /parkings/1
  # PATCH/PUT /parkings/1.json
  def update
    if @parking.update(@parking_params)
      render_success_format("correctly edited parking", @parking)
    end
  rescue StandardError => e
    Airbrake.notify(e)
    raise e
  end

  # DELETE /parkings/1
  # DELETE /parkings/1.json
  def destroy
    @parking.destroy
    render_destroy_format("parking removed")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking
      @parking = Parking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parking_params
      params.permit(:name, :addres, :phone, :quota)
    end
end
  end
