class Api::V1::StatusAuctionsController < ApplicationController
  before_action :set_status_auction, only: [:show, :update, :destroy]

  # GET /status_auctions
  def index
    @status_auctions = StatusAuction.all

    render json: @status_auctions
  end

  # GET /status_auctions/1
  def show
    render json: @status_auction
  end

  # POST /status_auctions
  def create
    @status_auction = StatusAuction.new(status_auction_params)

    if @status_auction.save
      render json: @status_auction, status: :created, location: @status_auction
    else
      render json: @status_auction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /status_auctions/1
  def update
    if @status_auction.update(status_auction_params)
      render json: @status_auction
    else
      render json: @status_auction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /status_auctions/1
  def destroy
    @status_auction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_auction
      @status_auction = StatusAuction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def status_auction_params
      params.require(:status_auction).permit(:description)
    end
end
