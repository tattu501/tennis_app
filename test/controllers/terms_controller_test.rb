require 'test_helper'

class TermsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get terms_new_url
    assert_response :success
  end

  test "should get show" do
    get terms_show_url
    assert_response :success
  end

end
