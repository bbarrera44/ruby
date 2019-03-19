module Api
class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  respond_to :json
  def all
  end
  def default_serializer_options
    { root: false }
  end

  include RenderHelper

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
    render_default_format(@ticket, true)
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    render_default_format(@ticket, true)
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    puts "llego"
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      render_success_format('ticket created correctly', @ticket)
    end
  rescue Exception => e
    render_default_error e, 401
    e.inspect
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    if @ticket.update(@ticket_params)
      render_success_format('client created correctly', @ticket)
    end
  rescue StandardError => e
    Airbrake.notify(e)
    raise e
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    render_destroy_format("ticket removed")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
      def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.permit(:entry_tine, :departure_time, :tariff_id, :vehicle_id)
    end
end
end