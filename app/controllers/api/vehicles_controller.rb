module Api
class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  respond_to :json
  def all
  end
  def default_serializer_options
    { root: false }
  end


  include RenderHelper

  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicle = Vehicle.all
    render_default_format(@vehicle, true)
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
    render_default_format(@vehicle, true)
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicles = Vehicle.new(client_params)
    if @vehicle.save
      render_success_format('client created correctly', @vehicle)
  end

rescue Exception => e
  render_default_error e, 401
end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
      if @vehicle.update(vehicle_params)
        render_success_format("correctly edited vehicles", @vehicle)
      end
  rescue StandardError => e
    Airbrake.notify(e)
    raise e
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    render_destroy_format("vehicle removed")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.permit(:vehicle).permit(:plate, :state, :client_id)
    end
end
  end
