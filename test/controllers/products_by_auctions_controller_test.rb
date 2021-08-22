require "test_helper"

class ProductsByAuctionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @products_by_auction = products_by_auctions(:one)
  end

  test "should get index" do
    get products_by_auctions_url, as: :json
    assert_response :success
  end

  test "should create products_by_auction" do
    assert_difference('ProductsByAuction.count') do
      post products_by_auctions_url, params: { products_by_auction: { auction_id: @products_by_auction.auction_id, product_id: @products_by_auction.product_id } }, as: :json
    end

    assert_response 201
  end

  test "should show products_by_auction" do
    get products_by_auction_url(@products_by_auction), as: :json
    assert_response :success
  end

  test "should update products_by_auction" do
    patch products_by_auction_url(@products_by_auction), params: { products_by_auction: { auction_id: @products_by_auction.auction_id, product_id: @products_by_auction.product_id } }, as: :json
    assert_response 200
  end

  test "should destroy products_by_auction" do
    assert_difference('ProductsByAuction.count', -1) do
      delete products_by_auction_url(@products_by_auction), as: :json
    end

    assert_response 204
  end
end
