def palindrome?(x)
  x.to_s == x.to_s.reverse && x.to_s(2) == x.to_s(2).reverse
end

class PalindromeController < ApplicationController
  def input
  end

  def view
    num = params[:num].to_i
    @result = (1..num).select{|x| palindrome?(x)}
    respond_to do |format|
      format.html
      format.json do
        render json: @result.map{|x| {dec: x.to_s, bin: x.to_s(2)}}
      end
    end
  end
end
