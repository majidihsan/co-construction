require 'rails_helper'

feature 'user adds a new company and become a contractor' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'can add new company to the website' do
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

    expect(page).to have_content('Project')
    expect(page).to have_content('Details')
    expect(page).to have_content('Join Us')

    click_link 'Join Us'

    visit new_company_path

    fill_in('Name', with: 'Paradise Construction')
    select "Mill Work", from: "Category"
    fill_in('Address', with: 'great street, NY')
    fill_in('Zipcode', with: '02446 ')
    fill_in('Phone', with: '8572128902')
    fill_in('Working hours', with: '9am - 5pm')
    fill_in('Working since', with: '1989')
    click_button 'Join'

    visit projects_path

    expect(page).to have_content('Project')
    expect(page).to have_content('Details')
    expect(page).to have_content("I'm interested")
    expect(page).to_not have_content('Join Us')
  end
end
