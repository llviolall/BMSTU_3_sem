require 'test_helper'

class UsersFlowsTest < ActionDispatch::IntegrationTest
  test "authenticated" do
    get '/signin'
    assert_response :success

    post users_url, params: { user: {name: "user5", password: "password", password_confirmation: "password"}}
#    res = User.find_by_name("user")
#    assert_equal res.password, "password"

    post '/session/create', params: {name: "user5", password: "password"}
    assert_response :redirect

    get palindrome_input_url
    assert_response :success

    get palindrome_view_url, params: {num: "5"}
    assert_response :success

    assert_select "table" do
      assert_select "tr", 3
    end

    assert_select "tr" do |elements|
      elements.each do |el|
        assert_select el, "td", 2
      end
    end

    assert_select "td", "1"
    assert_select "td", "1"
    assert_select "td", "3"
    assert_select "td", "11"
    assert_select "td", "5"
    assert_select "td", "101"
  end

  test "non authenticated" do
    get palindrome_input_url
    assert_response :redirect
    follow_redirect!
    assert_equal "/signin", path
  end

  test "Invalid password" do
    post '/session/create', params: {name: "user5", password: "password_wrong"}
    assert_response :redirect
    follow_redirect!
    assert_select "p", "Неправильный логин или пароль"
  end
end
