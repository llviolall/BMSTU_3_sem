require 'test_helper'

class XmlOrXsltControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get xml_or_xslt_input_url
    assert_response :success
  end

  test "should get view" do
    get xml_or_xslt_view_url
    assert_response :success
  end

  test "should get diff response" do
    get '/xml_or_xslt/view', params: { num: 10, response: 'XML' }
    assert_response :success
    assert_select "objects" do |objects|
      assert_select objects, "object", 5
    end

    get '/xml_or_xslt/view', params: { num: 5, response: 'XML' }
    assert_response :success
    assert_select "objects" do |objects|
      assert_select objects, "object", 3
    end
  end

  test 'check xml format' do
    get '/xml_or_xslt/view', params: { num: 10, response: 'XML' }
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/xml'
  end

  test 'check html format' do
    get '/xml_or_xslt/view', params: { num: 10, response: 'HTML' }
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'text/html'
  end

  test 'check xml+xslt format' do
    get '/xml_or_xslt/view', params: { num: 10, response: 'XML+XSLT' }
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/xml'
  end

end
