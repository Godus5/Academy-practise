require "application_system_test_case"

class LabReportsTest < ApplicationSystemTestCase
  setup do
    @lab_report = lab_reports(:one)
  end

  test "visiting the index" do
    visit lab_reports_url
    assert_selector "h1", text: "Lab reports"
  end

  test "should create lab report" do
    visit lab_reports_url
    click_on "New lab report"

    fill_in "Description", with: @lab_report.description
    fill_in "Grade", with: @lab_report.grade
    fill_in "Title", with: @lab_report.title
    fill_in "User", with: @lab_report.user_id
    click_on "Create Lab report"

    assert_text "Lab report was successfully created"
    click_on "Back"
  end

  test "should update Lab report" do
    visit lab_report_url(@lab_report)
    click_on "Edit this lab report", match: :first

    fill_in "Description", with: @lab_report.description
    fill_in "Grade", with: @lab_report.grade
    fill_in "Title", with: @lab_report.title
    fill_in "User", with: @lab_report.user_id
    click_on "Update Lab report"

    assert_text "Lab report was successfully updated"
    click_on "Back"
  end

  test "should destroy Lab report" do
    visit lab_report_url(@lab_report)
    click_on "Destroy this lab report", match: :first

    assert_text "Lab report was successfully destroyed"
  end
end
