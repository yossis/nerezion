require 'test_helper'

class BookComunitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_comunity = book_comunities(:one)
  end

  test "should get index" do
    get book_comunities_url
    assert_response :success
  end

  test "should get new" do
    get new_book_comunity_url
    assert_response :success
  end

  test "should create book_comunity" do
    assert_difference('BookComunity.count') do
      post book_comunities_url, params: { book_comunity: { about_me: @book_comunity.about_me, photo_form_today: @book_comunity.photo_form_today, photo_from_last: @book_comunity.photo_from_last, pupil_id: @book_comunity.pupil_id } }
    end

    assert_redirected_to book_comunity_url(BookComunity.last)
  end

  test "should show book_comunity" do
    get book_comunity_url(@book_comunity)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_comunity_url(@book_comunity)
    assert_response :success
  end

  test "should update book_comunity" do
    patch book_comunity_url(@book_comunity), params: { book_comunity: { about_me: @book_comunity.about_me, photo_form_today: @book_comunity.photo_form_today, photo_from_last: @book_comunity.photo_from_last, pupil_id: @book_comunity.pupil_id } }
    assert_redirected_to book_comunity_url(@book_comunity)
  end

  test "should destroy book_comunity" do
    assert_difference('BookComunity.count', -1) do
      delete book_comunity_url(@book_comunity)
    end

    assert_redirected_to book_comunities_url
  end
end
