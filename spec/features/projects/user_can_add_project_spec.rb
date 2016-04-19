require 'rails_helper'

feature 'user adds a new project' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'can add new project to the website' do
    visit root_path

    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    click_link 'Post A Project'

    expect(page).to have_field('Title')
    expect(page).to have_field('Description')
    expect(page).to have_field('Category')
    expect(page).to have_field('Duration')
    expect(page).to have_field('Address')
    expect(page).to have_field('Zipcode')
  end
  scenario 'user successfully adds a Project' do
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
  end
end
