class AuctionWinner < ApplicationRecord
  belongs_to :product
  belongs_to :auction
  belongs_to :user
end
