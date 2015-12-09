require "rails_helper"

feature "User views assessment report" do
  scenario "sees assessment results for the course" do
    result = create(:result)
    course = result.assessment.courses.first
    user = user_with_assessments_access_to(course.department)

    visit course_assessment_report_path(course_id: course, as: user)
    click_link I18n.t("reports.assessment_reports.show.csv_link")
    header = page.response_headers["Content-Disposition"]

    expect(header).to match(/^attachment/)
    expect(header).to match(/filename="#{course.name.parameterize}-assessment-report.csv"$/)
  end
end