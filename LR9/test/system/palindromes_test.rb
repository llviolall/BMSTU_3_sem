require "application_system_test_case"

class PalindromesTest < ApplicationSystemTestCase
  test 'Calc palindromes via AJAX' do
    visit palindrome_input_path

    within('form#input_frm') do
      sleep 3
      fill_in 'num', with: '10'
      sleep 3
      click_on 'Show palindromes from 1 to num'
    end

    within '#result' do
      assert_text '1 1'
      assert_text '3 11'
      assert_text '5 101'
      assert_text '7 111'
      assert_text '9 1001'
    end
    sleep 3
  end
end
