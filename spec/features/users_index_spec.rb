require 'rails_helper'

RSpec.describe 'Testing user index page', type: :feature do
  before(:each) do
    @first = User.create(name: 'Nicholas', photo: 'profile.jpg',
                         bio: 'Developer.',
                         email: 'nicbkee@email.com',
                         password: 'password', confirmed_at: Time.now,
                         posts_counter: 0, role: 'admin')

    @second = User.create(name: 'Iknw', photo: 'profile.jpg',
                          bio: 'Developer.', email: 'msgeme@email.com',
                          password: 'password', confirmed_at: Time.now,
                          posts_counter: 0, role: 'admin')

    @third = User.create(name: 'kyut', photo: 'profile.jpg',
                         bio: 'Developer.', email: 'kyut@email.com',
                         password: 'password', confirmed_at: Time.now,
                         posts_counter: 0, role: 'admin')

    visit user_session_path

    within 'form' do
      fill_in 'Email', with: @first.email
      fill_in 'Password', with: @first.password
    end

    click_button 'Log in'
  end

  feature 'User Index' do
    background { visit root_path }
    scenario 'See all usernames' do
      expect(page).to have_content('Nicholas')
      expect(page).to have_content('Iknw')
      expect(page).to have_content('kyut')
    end
  end

  scenario 'See profile picture for each user' do
    expect(page.first('img')['src']).to have_content '.jpg'
  end

  scenario 'See the number of posts each user has written' do
    expect(page).to have_content('Number of posts: 0')
  end

  scenario "When I click on a user, I am redirected to that user's show page" do
    click_link 'Nicholas', match: :first
    expect(current_path).to eq user_path(User.first.id)
  end
end

RSpec.describe 'Testing user index page', type: :feature do
  before(:each) do
    @first = User.create(name: 'Nicholas', photo: 'avatar.png',
                         bio: 'Developer.',
                         email: 'nicbkee@email.com',
                         password: 'password', confirmed_at: Time.now,
                         posts_counter: 0, role: 'admin')

    @second = User.create(name: 'Iknw', photo: 'avatar.png',
                          bio: 'Developer.', email: 'msgeme@email.com',
                          password: 'password', confirmed_at: Time.now,
                          posts_counter: 0, role: 'admin')

    @third = User.create(name: 'kyut', photo: 'avatar.png',
                         bio: 'Developer.', email: 'kyut@email.com',
                         password: 'password', confirmed_at: Time.now,
                         posts_counter: 0, role: 'admin')

    visit user_session_path

    within 'form' do
      fill_in 'Email', with: @first.email
      fill_in 'Password', with: @first.password
    end

    click_button 'Log in'
  end

  feature 'User Index' do
    background { visit root_path }
    scenario 'See all usernames' do
      expect(page).to have_content('Nicholas')
      expect(page).to have_content('Iknw')
      expect(page).to have_content('kyut')
    end
  end

  scenario 'See profile picture for each user' do
    expect(page.first('img')['src']).to have_content 'avatar.png'
  end

  scenario 'See the number of posts each user has written' do
    expect(page).to have_content('Number of posts: 0')
  end

  scenario "When I click on a user, I am redirected to that user's show page" do
    click_link 'Nicholas', match: :first
    expect(current_path).to eq user_path(User.first.id)
  end
end
