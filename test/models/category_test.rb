require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "check the '1st_category' from databade" do
    category_first = Category.find_by(name: "1st Category")
    assert_equal("1st Category", category_first.name)
  end

  test "check the '2st_category' from databade" do
    category_second = Category.find_by(description: "2nd description")
    assert_equal("2nd Category", category_second.name)
  end

  test "return false if name is missed" do
    new_category = Category.new(description: "2nd description")
    assert_not(new_category.valid?)
  end

  test "return false if description is missed" do
    new_category = Category.new(name: "3rd Category")
    assert_not(new_category.valid?)
  end

  test "return true if everything is good" do
    new_category = Category.new(name: "50th Category", description: "50th description")
    assert(new_category.valid?)
  end

  test "saving and gathering" do
    new_category = Category.new(name: "new category", description: "new description")
    new_category.save()
    new_cat = Category.find_by(name: "new category")
    assert_equal("new description", new_cat.description)
  end

end
