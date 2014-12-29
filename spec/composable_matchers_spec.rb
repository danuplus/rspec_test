describe "Composable Matchers" do
	it "works with nested data" do
		class Product
			def initialize id, name, category
				@id = id
				@name = name
				@category = category
			end

		def serial_data
			[
				"X-",
				@name[0],
				@category[0],
				@id
			]
		end
	end

	product = Product.new 2456, "Tomato", "Fruits"

	# Matchers
	# -----------
		# change
		# contain_exactly 
		# include
		# yield_with_args(a_string_starting_with, a_hash_including())
	# Matchers arguments
	# ------------------
		# a_string_starting_with/ending_with
		# a_hash_including
	  # a_value_within(0.5).of(3.145) 3.14 3.15
		# an_instance_of(Hash)
	
	expect(product.serial_data).to match [
			a_string_starting_with("X-"),
			a_string_starting_with("T"),
			a_string_starting_with("F"),
			a_value < 5000
		]	# X-TF2456

	expect(product.serial_data).to contain_exactly(
			a_string_starting_with("X-"),
			a_string_starting_with("T"),
			a_string_starting_with("F"),
			a_value < 5000
		)	# X-TF2456
		
	end

	it "compound matchers" do
		string = "jose"

		expect(string).to start_with("j").and end_with("e")
		expect(string).to start_with("J").or end_with("e")
		expect(50).to eq(50).or eq 20
	end
end
