require 'rails_helper'

feature 'user edits a existing project' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:project) {FactoryGirl.create(:project)}
  let!(:proposal) {FactoryGirl.create(:proposal)}

  scenario 'user successfully edits a Project' do
    visit root_path

    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    click_link 'Post A Project'

    visit new_project_path

    fill_in('Title', with: 'Living Room Renovation')
    fill_in('Description', with: 'Want to redo all the flooring')
    select "Mill Work", from: "Category"
    fill_in('Duration', with: '3 months')
    fill_in('Address', with: '5 bradford terrace Brookline, MA ')
    fill_in('Zipcode', with: '02446 ')
    click_button 'Post Project'
    visit projects_path

    expect(page).to have_content('Living Room Renovation')
    expect(page).to have_content('Want to redo all the flooring')
    expect(page).to have_content('5 bradford terrace Brookline, MA')

    click_link 'Edit'
    fill_in('Title', with: 'This is testing Update feature')
    fill_in('Description', with: 'This is testing Update feature')
    click_button 'Update Project'

    expect(page).to have_content('This is testing Update feature')
  end
    scenario 'user cannot edit a Project with invalid data' do

      visit root_path

      click_link 'Sign in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      visit edit_project_path(project)

      fill_in('Title', with: 'This is testing Update feature')
      fill_in('Description', with: 'This is testing Update feature')
      fill_in('Duration', with: "")
      click_button 'Update Project'

      expect(page).to have_content("Duration can't be blank")
  end
end
