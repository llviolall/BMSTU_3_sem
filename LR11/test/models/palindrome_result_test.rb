require 'test_helper'

class PalindromeResultTest < ActiveSupport::TestCase
  def setup
    @num=10
    @text="MyText"
  end
  test 'add and read db' do
    new_entry = PalindromeResult.new do |t|
      t.num = @num
      t.result = @text
    end
    assert new_entry.save
    find_entry = PalindromeResult.find_by_num(@num)
    assert_equal @num, find_entry.num
    assert_equal @text, find_entry.result
  end

  test "valid test" do
    new_entry = PalindromeResult.new do |t|
      t.num = @num
      t.result = @text
    end
    new_entry.save
    new_entry = PalindromeResult.new do |t|
      t.num = @num
      t.result = "another text"
    end
    assert new_entry.invalid?
  end
end
