require "rails_helper"

feature "User can create a new todo" do
  scenario "from new page" do
    todo_body = "File taxes"
    scheduled_for_date = "August 21, 2021"
    scheduled_for_time = "12:00 PM"

    sign_in(create(:user))
    visit new_todo_path

    fill_in(:todo_body, with: todo_body)
    fill_in(:todo_reminder_scheduled_for_date, with: scheduled_for_date)
    fill_in(:todo_reminder_scheduled_for_time, with: scheduled_for_time)
    click_on("Add")

    expect(page).to have_content(todo_body)
    expect(page).to have_content(scheduled_for_date)
    expect(page).to have_content(scheduled_for_time)
  end
end
