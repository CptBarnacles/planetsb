class Planet < ApplicationRecord
  has_many :sponsors
	paginates_per 10

  def self.search(term)
    if
      where('pl_name LIKE ?',"%#{term}%")
    else
      paginates_per(15)
    end
  end
end
