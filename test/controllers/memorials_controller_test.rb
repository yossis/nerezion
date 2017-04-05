require 'test_helper'

class MemorialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @memorial = memorials(:one)
  end

  test "should get index" do
    get memorials_url
    assert_response :success
  end

  test "should get new" do
    get new_memorial_url
    assert_response :success
  end

  test "should create memorial" do
    assert_difference('Memorial.count') do
      post memorials_url, params: { memorial: { book_id: @memorial.book_id, content: @memorial.content, pupil_id_reciver: @memorial.pupil_id_reciver, pupil_id_sender: @memorial.pupil_id_sender } }
    end

    assert_redirected_to memorial_url(Memorial.last)
  end

  test "should show memorial" do
    get memorial_url(@memorial)
    assert_response :success
  end

  test "should get edit" do
    get edit_memorial_url(@memorial)
    assert_response :success
  end

  test "should update memorial" do
    patch memorial_url(@memorial), params: { memorial: { book_id: @memorial.book_id, content: @memorial.content, pupil_id_reciver: @memorial.pupil_id_reciver, pupil_id_sender: @memorial.pupil_id_sender } }
    assert_redirected_to memorial_url(@memorial)
  end

  test "should destroy memorial" do
    assert_difference('Memorial.count', -1) do
      delete memorial_url(@memorial)
    end

    assert_redirected_to memorials_url
  end
end
