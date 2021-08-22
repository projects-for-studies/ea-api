class Api::V1::AuctionsController < ApplicationController
  before_action :set_auction, only: [:show, :update, :destroy]

  # GET /auctions
  def index
    @auctions = Auction.all

    render json: @auctions
  end

  # GET /auctions/1
  def show
    render json: @auction
  end

  # POST /auctions
  def create
    @auction = Auction.new(auction_params)

    if @auction.save
      render json: @auction, status: :created, location: @auction
    else
      render json: @auction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /auctions/1
  def update
    if @auction.update(auction_params)
      render json: @auction
    else
      render json: @auction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /auctions/1
  def destroy
    @auction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auction
      @auction = Auction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def auction_params
      params.require(:auction).permit(:user_id, :status_auction_id, :start_date, :final_date)
    end
end
