class Buy < ApplicationRecord
  has_one :item
  belongs_to :users
end
