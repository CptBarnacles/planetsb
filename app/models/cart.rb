class Cart < ApplicationRecord
	has_many :line_items, dependent: :destroy

	def add_product(sponsor)
    	current_item = line_items.find_by(sponsor_id: sponsor.id)
    	if current_item
            current_item.quantity += 1
        else
          current_item = line_items.build(sponsor_id: sponsor.id)
        end
        current_item
    end

    def total_price
        line_items.to_a.sum { |total| total.total_price }
    end
end
