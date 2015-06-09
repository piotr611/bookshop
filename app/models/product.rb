class Product < ActiveRecord::Base
	validates :title, :description, :price, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true, length: {minimum: 3}
	validates :image_url, allow_blank: true, format: { with: %r{\.(gif|jpg|png)\Z}i, message: 'URL have to include GIF, JPG or PNG formats'}

	def self.latest
		Product.order(:update_at).last
	end	

end
