class ProductsByAuction < ApplicationRecord
  belongs_to :product
  belongs_to :auction
end
