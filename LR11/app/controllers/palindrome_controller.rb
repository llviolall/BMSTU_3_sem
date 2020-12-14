class PalindromeController < ApplicationController
  def input
  end

  def view
    num = params[:num].to_i
    if res = PalindromeResult.find_by_num(num)
      @result=ActiveSupport::JSON.decode(res.result)
    else
      @result = (1..num).select{|x| palindrome?(x)}
      PalindromeResult.new do |t|
        t.num = num
        t.result = ActiveSupport::JSON.encode(@result)
      end
      .save
    end
  end

  def index
    all=PalindromeResult.all
    respond_to do |format|
      format.xml { render xml: all }
      format.json { render json: all }
      format.any { render inline: "Use .xml or .json format" }
    end
  end

  private

  def palindrome?(x)
    x.to_s == x.to_s.reverse && x.to_s(2) == x.to_s(2).reverse
  end
end
