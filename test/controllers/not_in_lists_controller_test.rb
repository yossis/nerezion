require 'test_helper'

class NotInListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @not_in_list = not_in_lists(:one)
  end

  test "should get index" do
    get not_in_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_not_in_list_url
    assert_response :success
  end

  test "should create not_in_list" do
    assert_difference('NotInList.count') do
      post not_in_lists_url, params: { not_in_list: { class_name: @not_in_list.class_name, email: @not_in_list.email, full_name: @not_in_list.full_name, is_teacher: @not_in_list.is_teacher, phone_number: @not_in_list.phone_number } }
    end

    assert_redirected_to not_in_list_url(NotInList.last)
  end

  test "should show not_in_list" do
    get not_in_list_url(@not_in_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_not_in_list_url(@not_in_list)
    assert_response :success
  end

  test "should update not_in_list" do
    patch not_in_list_url(@not_in_list), params: { not_in_list: { class_name: @not_in_list.class_name, email: @not_in_list.email, full_name: @not_in_list.full_name, is_teacher: @not_in_list.is_teacher, phone_number: @not_in_list.phone_number } }
    assert_redirected_to not_in_list_url(@not_in_list)
  end

  test "should destroy not_in_list" do
    assert_difference('NotInList.count', -1) do
      delete not_in_list_url(@not_in_list)
    end

    assert_redirected_to not_in_lists_url
  end
end
