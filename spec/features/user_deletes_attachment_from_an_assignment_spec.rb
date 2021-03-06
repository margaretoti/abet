require "rails_helper"

feature "User views attachment count and deletes an attachment from
  an assignment", js: true do
  scenario "successfully" do
    assignment = create(:assignment)
    attachment = create(:attachment, attachable: assignment)
    attachment_count = assignment.attachments.size
    user = user_with_assignments_access_to(assignment.course.department)

    visit manage_assignments_course_path(assignment.course.id, as: user)

    within(".class-card-assignment-controls") do
      expect(page).to have_content(attachment_count)
    end

    click_on t("manage_assignments.outcome_coverages.outcome_coverage.attachments-expandable-link")

    delete_assignment

    expect(page).to have_content(assignment.name)
    expect(page).to have_no_content(attachment.file_file_name)

    within(".class-card-assignment-controls") do
      expect(page).to have_no_content(attachment_count)
    end
  end

  def delete_assignment
    within(".assignment-attachments") do
      click_on t("manage_assignments.shared.attachments.delete_link")
    end
  end
end
