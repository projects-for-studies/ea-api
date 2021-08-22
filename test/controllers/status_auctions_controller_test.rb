require "test_helper"

class StatusAuctionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @status_auction = status_auctions(:one)
  end

  test "should get index" do
    get status_auctions_url, as: :json
    assert_response :success
  end

  test "should create status_auction" do
    assert_difference('StatusAuction.count') do
      post status_auctions_url, params: { status_auction: { description: @status_auction.description } }, as: :json
    end

    assert_response 201
  end

  test "should show status_auction" do
    get status_auction_url(@status_auction), as: :json
    assert_response :success
  end

  test "should update status_auction" do
    patch status_auction_url(@status_auction), params: { status_auction: { description: @status_auction.description } }, as: :json
    assert_response 200
  end

  test "should destroy status_auction" do
    assert_difference('StatusAuction.count', -1) do
      delete status_auction_url(@status_auction), as: :json
    end

    assert_response 204
  end
end
