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
end
