class Product < ActiveRecord::Base
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

	validates :title, :description, :price, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true, length: {minimum: 3}
	validates :image_url, allow_blank: true, format: { with: %r{\.(gif|jpg|png)\Z}i, message: 'URL have to include GIF, JPG or PNG formats'}

	def self.latest
		Product.order(:update_at).last
	end	

	private

	#connecting method
	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'you have line_items with the product')
			return false
		end
	end
end
