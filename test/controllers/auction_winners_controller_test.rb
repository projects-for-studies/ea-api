require "test_helper"

class AuctionWinnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auction_winner = auction_winners(:one)
  end

  test "should get index" do
    get auction_winners_url, as: :json
    assert_response :success
  end

  test "should create auction_winner" do
    assert_difference('AuctionWinner.count') do
      post auction_winners_url, params: { auction_winner: { auction_id: @auction_winner.auction_id, product_id: @auction_winner.product_id, user_id: @auction_winner.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show auction_winner" do
    get auction_winner_url(@auction_winner), as: :json
    assert_response :success
  end

  test "should update auction_winner" do
    patch auction_winner_url(@auction_winner), params: { auction_winner: { auction_id: @auction_winner.auction_id, product_id: @auction_winner.product_id, user_id: @auction_winner.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy auction_winner" do
    assert_difference('AuctionWinner.count', -1) do
      delete auction_winner_url(@auction_winner), as: :json
    end

    assert_response 204
  end
end
