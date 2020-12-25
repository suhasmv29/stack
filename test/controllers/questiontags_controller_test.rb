require 'test_helper'

class QuestiontagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @questiontag = questiontags(:one)
  end

  test "should get index" do
    get questiontags_url
    assert_response :success
  end

  test "should get new" do
    get new_questiontag_url
    assert_response :success
  end

  test "should create questiontag" do
    assert_difference('Questiontag.count') do
      post questiontags_url, params: { questiontag: { question_id: @questiontag.question_id, tag_id: @questiontag.tag_id } }
    end

    assert_redirected_to questiontag_url(Questiontag.last)
  end

  test "should show questiontag" do
    get questiontag_url(@questiontag)
    assert_response :success
  end

  test "should get edit" do
    get edit_questiontag_url(@questiontag)
    assert_response :success
  end

  test "should update questiontag" do
    patch questiontag_url(@questiontag), params: { questiontag: { question_id: @questiontag.question_id, tag_id: @questiontag.tag_id } }
    assert_redirected_to questiontag_url(@questiontag)
  end

  test "should destroy questiontag" do
    assert_difference('Questiontag.count', -1) do
      delete questiontag_url(@questiontag)
    end

    assert_redirected_to questiontags_url
  end
end
