require "application_system_test_case"

class QuestiontagsTest < ApplicationSystemTestCase
  setup do
    @questiontag = questiontags(:one)
  end

  test "visiting the index" do
    visit questiontags_url
    assert_selector "h1", text: "Questiontags"
  end

  test "creating a Questiontag" do
    visit questiontags_url
    click_on "New Questiontag"

    fill_in "Question", with: @questiontag.question_id
    fill_in "Tag", with: @questiontag.tag_id
    click_on "Create Questiontag"

    assert_text "Questiontag was successfully created"
    click_on "Back"
  end

  test "updating a Questiontag" do
    visit questiontags_url
    click_on "Edit", match: :first

    fill_in "Question", with: @questiontag.question_id
    fill_in "Tag", with: @questiontag.tag_id
    click_on "Update Questiontag"

    assert_text "Questiontag was successfully updated"
    click_on "Back"
  end

  test "destroying a Questiontag" do
    visit questiontags_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Questiontag was successfully destroyed"
  end
end
