class Order < ActiveRecord::Base	
	PAYMENT_TYPES = %w{ Check Credit Other }

	validates :address, :email, presence: true
	validates :pay_type, inclusion: PAYMENT_TYPES
end
