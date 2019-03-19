module Api
class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  respond_to :json
  def all
  end
  def default_serializer_options
    { root: false }
  end

  include RenderHelper
  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
    render_default_format(@clients, true)
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
    render_default_format(@client, true)
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    puts "llego"
    @client = Client.new(client_params)
    if @client.save
      render_success_format('client created correctly', @client)

    end


  rescue Exception => e
    render_default_error e, 401
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    if @client.update(client_params)
      render_success_format("correctly edited client", @client)
    end
  rescue StandardError => e
    Airbrake.notify(e)
    raise e
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    render_destroy_format("clients removed")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.permit(:address, :name, :surname, :phone, :email, :num_document, :parking_id)
    end
end
  end
