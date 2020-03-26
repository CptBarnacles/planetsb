class LineItem < ApplicationRecord
  belongs_to :sponsor
  belongs_to :cart
  belongs_to :order
  has_many :sponsors
  enum donation: {
  	"1 Month" => "1Month",
  	"3 Months" => "3Months",
  	"6 Months" => "6Months"
  }
end
