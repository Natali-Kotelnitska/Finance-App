require "test_helper"

class OperationTest < ActiveSupport::TestCase
  test "check the '1st_operation' from databade" do
    operation_first = Operation.find_by(description: "1st Operation Description")
    assert_equal("1st Operation Description", operation_first.description)
  end

  test "check the '2st_operation' from databade" do
    operation_second = Operation.find_by(otype: "expense")
    assert_equal("expense", operation_second.otype)
  end

  test "return false if category is missed" do
    new_operation = Operation.new(amount: "565", odate: "2023-06-11 11:17:08", description: "New Operation Description", otype: "expense")
    assert_not(new_operation.valid?)
  end

end
