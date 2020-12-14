require 'nokogiri'
require 'open-uri'

class XmlOrXsltController < ApplicationController
  def input
  end

  def view
    num=params[:num]
    resp=params[:response]

    url = BASE_API_URL + "&num=#{num}"
    xml_resp = open(url)

    if resp == 'XML'
      render xml: xml_resp
    elsif resp == 'HTML'
      render inline: xslt_transform(xml_resp)
    elsif resp == 'XML+XSLT'
      render xml: insert_browser_xslt(xml_resp)
    end
  end

  private

  BASE_API_URL           = 'http://localhost:3000/?format=xml'.freeze
  XSLT_SERVER_TRANSFORM  = "#{Rails.root}/public/transform.xslt".freeze
  XSLT_BROWSER_TRANSFORM = '/transform.xslt'.freeze

  def xslt_transform(data, transform: XSLT_SERVER_TRANSFORM)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read(transform))
    xslt.transform(doc)
  end

  def insert_browser_xslt(data, transform: XSLT_BROWSER_TRANSFORM)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc,'xml-stylesheet','type="text/xsl" href="' + transform + '"')
    doc.root.add_previous_sibling(xslt)
    doc
  end
end
