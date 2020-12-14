require 'test_helper'

class PalindromeControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get palindrome_input_url
    assert_response :success
  end

  test "should get view" do
    get palindrome_view_url
    assert_response :success
  end
#=begin
  test "should get [1] for num = 1" do
    get palindrome_view_url, params: { num: 1 }
    assert_equal assigns[:result], [1]
  end

  test "should get [1,3,5,7,9] for num = 10" do
    get palindrome_view_url, params: { num: 10 }
    assert_equal assigns(:result), [1,3,5,7,9]
  end
#=end
end
