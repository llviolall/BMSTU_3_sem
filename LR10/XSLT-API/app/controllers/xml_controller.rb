class XmlController < ApplicationController
  def index
    num = params[:num].to_i
    data = (1..num).select{|x| palindrome?(x)}
    data = data.map{|x| {dec: x.to_s, bin: x.to_s(2)}}
    respond_to do |format|
      format.xml { render xml: data.to_xml }
      format.rss { render xml: data.to_xml }
    end
  end

  private 
  
  def palindrome?(x)
    x.to_s == x.to_s.reverse && x.to_s(2) == x.to_s(2).reverse
  end
end
