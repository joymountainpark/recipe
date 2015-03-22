require 'test_helper'

class MyrecipeTest < ActiveSupport::TestCase

	def setup
		@myrecipe = Myrecipe.new(name: "chicken parm", summary: "This is the best chicken parm recipe ever", 
			description: "heat oil, add onion, add tomato sauce, and chicken, cook for 20 minutes")
	end

	test "myrecipe should be valid" do
		assert @myrecipe.valid?
	end

	test "name should be present" do
		@myrecipe.name = " "
		assert_not @myrecipe.valid?
	end

	test "name length should not be too long" do
		@myrecipe.name = "a" * 101
		assert_not @myrecipe.valid?
	end

	test "name length should not be too short" do
		@myrecipe.name = "aaaa"
		assert_not @myrecipe.valid? 
	end

	test "summary should be present" do
		@myrecipe.summary = " "
		assert_not @myrecipe.valid?
	end

	test "summary length should not be too long" do
		@myrecipe.summary = "a" * 151
		assert_not @myrecipe.valid?
	end

	test "summary length should not be too short" do
		@myrecipe.summary = "a" * 9
		assert_not @myrecipe.valid?
	end

	test "description must be present" do
		@myrecipe.description = " "
		assert_not @myrecipe.valid?
	end

	test "description should not be too long" do
		@myrecipe.description = "a" * 501
		assert_not @myrecipe.valid?
	end

	test "description should not be too short" do
		@myrecipe.description = "a" * 19
		assert_not @myrecipe.valid?
	end

end
