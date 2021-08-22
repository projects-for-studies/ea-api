class AuctionWinnersController < ApplicationController
  before_action :set_auction_winner, only: [:show, :update, :destroy]

  # GET /auction_winners
  def index
    @auction_winners = AuctionWinner.all

    render json: @auction_winners
  end

  # GET /auction_winners/1
  def show
    render json: @auction_winner
  end

  # POST /auction_winners
  def create
    @auction_winner = AuctionWinner.new(auction_winner_params)

    if @auction_winner.save
      render json: @auction_winner, status: :created, location: @auction_winner
    else
      render json: @auction_winner.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /auction_winners/1
  def update
    if @auction_winner.update(auction_winner_params)
      render json: @auction_winner
    else
      render json: @auction_winner.errors, status: :unprocessable_entity
    end
  end

  # DELETE /auction_winners/1
  def destroy
    @auction_winner.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auction_winner
      @auction_winner = AuctionWinner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def auction_winner_params
      params.require(:auction_winner).permit(:product_id, :auction_id, :user_id)
    end
end
