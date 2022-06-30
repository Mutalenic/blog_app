require 'rails_helper'

RSpec.feature 'user show page',
              type: :feature do
  before(:each) do
    User.destroy_all
    @first = User.create(name: 'Nicholas', photo: 'avatar.png',
                         bio: 'Developer', email: 'nico@gmail.com', password: 'password',
                         confirmed_at: Time.now, role: 'admin', posts_counter: 0)

    7.times do |i|
      @p = Post.create(author: @first, title: "Post #{i}", text: "This is a post #{i}",
                       likes_counter: 0, comments_counter: 0)
    end

    visit user_session_path

    within 'form' do
      fill_in 'Email', with: @first.email
      fill_in 'Password', with: @first.password
    end

    click_button 'Log in'
  end

  background { visit user_path(User.first.id) }

  scenario "I can see the user's username" do
    expect(page).to have_content('Nicholas')
  end

  scenario "I can see the user's profile picture" do
    expect(page.first('img')['src']).to have_content 'avatar'
  end

  scenario "I can see the user's bio" do
    expect(page).to have_content('Developer')
  end

  scenario "I can see a button that lets me view all of a user's posts" do
    click_link('See all posts')
    expect(current_path).to eq user_posts_path(User.first.id)
  end

  scenario 'I can see the number of posts a user has written' do
    expect(page).to have_content('Number of posts: 7')
  end

  scenario "I can see the user's first 3 posts" do
    expect(page).to have_content('This is a post 6')
    expect(page).to have_content('This is a post 5')
    expect(page).to have_content('This is a post 4')
  end

  scenario "When I click on a post, I am redirected to that post's show page" do
    visit user_path(User.first.id)
    expect(page).to have_content('This is a post 6')
  end
end
