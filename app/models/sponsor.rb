class Sponsor < ApplicationRecord
  belongs_to :user
  belongs_to :planet
  has_many :line_items
  has_many :orders, through: :line_items
  paginates_per 10
end
