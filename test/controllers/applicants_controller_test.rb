require 'test_helper'

class ApplicantsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get applicants_new_url
    assert_response :success
  end

  test "should get edit" do
    get applicants_edit_url
    assert_response :success
  end

  test "should get show" do
    get applicants_show_url
    assert_response :success
  end

  test "should get index" do
    get applicants_index_url
    assert_response :success
  end

end
