class PalindromeController < ApplicationController
  def input
  end

  def view
    num = params[:num].to_i
    @result = (1..num).select{|x| palindrome?(x)}
  end

  private

  def palindrome?(x)
    x.to_s == x.to_s.reverse && x.to_s(2) == x.to_s(2).reverse
  end
end
