require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	fixtures :products

    def new_product(image_url)
    	Product.new(	title: "my title",
    					description: "me description",
    					price: 99.99,
    					image_url: image_url)
    	
    end

    test "product attribute must not be empty" do
      product = Product.new
      assert product.invalid?
      assert product.errors[:title].any?
      assert product.errors[:description].any?
      assert product.errors[:price].any?
    end

    test "product price must be positive" do
    	product = Product.new(  title: "my title t",
    							description: "my description t")

    	product.price = -2
    	assert product.invalid? 
    	#assert_equal ["must be griter or equal 0.01"], product.errors[:price]

    	product.price = 0
    	assert product.invalid?
    	#assert_equal ["must be griter or equal 0.01"], product.errors[:price]

    	product.price = 1
    	assert product.valid?

    end

    test "image url" do 
    	product = Product.new(	title: "my title",
    							description: "me description",
    							price: 99.99)
    	ok = %w{1.gif 2.jpg 3.png}
    	bad = %w{1.doc 2.gif123 3.gif.qwe}

    	ok.each do |name|
    		assert new_product(name).valid?, "#{name} should not be invalid"
    	end

    	bad.each do |name|
    		assert new_product(name).invalid?, "#{name} should not be valid"
    	end 

	end

	test "product is not valid without an unique title" do
		product = Product.new(	title: products(:true_data).title,
								description: "me description too",
    							price: 99.99)
		assert product.invalid?
	end

	test "very small title" do
		product = Product.new( title: products(:false_title_only_2_symbols).title,
								description: "me description too",
    							price: 99.99)
		assert product.invalid?
	end

end
