class ProductsByAuctionsController < ApplicationController
  before_action :set_products_by_auction, only: [:show, :update, :destroy]

  # GET /products_by_auctions
  def index
    @products_by_auctions = ProductsByAuction.all

    render json: @products_by_auctions
  end

  # GET /products_by_auctions/1
  def show
    render json: @products_by_auction
  end

  # POST /products_by_auctions
  def create
    @products_by_auction = ProductsByAuction.new(products_by_auction_params)

    if @products_by_auction.save
      render json: @products_by_auction, status: :created, location: @products_by_auction
    else
      render json: @products_by_auction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products_by_auctions/1
  def update
    if @products_by_auction.update(products_by_auction_params)
      render json: @products_by_auction
    else
      render json: @products_by_auction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products_by_auctions/1
  def destroy
    @products_by_auction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_products_by_auction
      @products_by_auction = ProductsByAuction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def products_by_auction_params
      params.require(:products_by_auction).permit(:product_id, :auction_id)
    end
end
