class Planet < ApplicationRecord
	paginates_per 10

  def self.search(term)
    if
      where('pl_name LIKE ?',"%#{term}%")
    else
      first(15)
    end
  end
end
