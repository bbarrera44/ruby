module Api
class TariffsController < ApplicationController
  before_action :set_tariff, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  respond_to :json
  def all
  end
  def default_serializer_options
    { root: false }
  end


  include RenderHelper
  # GET /tariffs
  # GET /tariffs.json
  def index
    @tariff = Tariff.all
    render_default_format(@tariff, true)
  end

  # GET /tariffs/1
  # GET /tariffs/1.json
  def show
  end

  # GET /tariffs/new
  def new
    @tariff = Tariff.new
  end

  # GET /tariffs/1/edit
  def edit
  end

  # POST /tariffs
  # POST /tariffs.json
    def create
      @tariff = Tariff.new(tariff_params)
      if @tariff.save
        render_success_format("tariff created correctly ", @tariff )
      end
    rescue Exception => e
      render_default_error e, 401
    end


  # PATCH/PUT /tariffs/1
  # PATCH/PUT /tariffs/1.json
  def update
    if @tariff.update(tariff_params)
      render_success_format("correctly edited tariff", @tariff)
    end
  rescue StandardError => e
    Airbrake.notify(e)
    raise e
  end
  # DELETE /tariffs/1
  # DELETE /tariffs/1.json
  def destroy
    @tariff.destroy
    render_destroy_format("tariff removed")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tariff
      @tariff = Tariff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tariff_params
      params.permit(:name, :value)
    end
end
end