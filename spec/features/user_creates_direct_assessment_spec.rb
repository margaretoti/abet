require "rails_helper"

feature "User creates an assessment" do
  scenario "a new assessment is created" do
    subject_title = create(:subject).title
    outcome = create(:outcome)
    user = user_with_admin_access_to(outcome.department)

    visit assessments_dashboard_path(as: user)
    within("#outcome_#{outcome.id}") do
      click_on "Assess"
    end

    click_on "Grade from an assignment, quiz, or exam"

    fill_and_submit_form

    within("#direct_assessments") do
      expect(page).to have_content(subject_title)
    end
  end

  def fill_and_submit_form
    select all("#direct_assessment_subject_id option").last.text, from: "direct_assessment_subject_id"
    fill_in "direct_assessment_name", with: "Problem Set 1"
    fill_in "direct_assessment_description", with: "Integration"
    fill_in "direct_assessment_problem_description", with: "Integration by parts"
    fill_in "direct_assessment_minimum_requirement", with: "7/10"
    fill_in "direct_assessment_target_percentage", with: 80
    click_on "Submit"
  end
end
