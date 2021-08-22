class Auction < ApplicationRecord
  belongs_to :user
  belongs_to :status_auction
end
