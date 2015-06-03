require "rails_helper"

feature "User creates other assessment" do
  scenario "a new assessment is created" do
    outcome = create(:outcome)
    user = create(:user)
    grant_access(user, outcome.course.department, Permission::ADMIN)

    visit course_path(outcome.course, as: user)
    within("#outcome-#{outcome.id}") do
      click_on "Add new assessment"
    end

    click_on "Other"

    fill_and_submit_form

    within("#indirect_assessments") do
      expect(page).to have_content("Senior Thesis Completion")
    end
  end

  def fill_and_submit_form
    fill_in "other_assessment_assessment_name", with: "Senior Thesis Completion"
    fill_in "other_assessment_assessment_description", with: "Percent of students who complete"
    fill_in "other_assessment_target_percentage", with: 80
    fill_in "other_assessment_actual_percentage", with: 78
    click_on "Submit"
  end
end
