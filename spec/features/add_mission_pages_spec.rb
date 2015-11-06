require 'rails_helper'

describe "the add a mission process" do
  it "adds a new mission", js: true do
    user = User.create(:email => "admin@example.com",
                        :username => "admin",
                        :password => "password",
                        :admin? => true)
    quest = Quest.create(:name => "Test",
                          :user_id => 1)
    visit "/users/sign_in"
    fill_in "Email",                 :with => "admin@example.com"
    fill_in "Password",              :with => "password"
    click_button "Sign In"
    click_on "Quests"
    click_on "Add a Mission"
    fill_in "Mission Description", :with => "Testing...123"
    click_button "Save"
    expect(page).to have_content "Testing...123"
  end

  it "gives error when no description is entered", js: true do
    user = User.create(:email => "admin@example.com",
                        :username => "admin",
                        :password => "password",
                        :admin? => true)
    quest = Quest.create(:name => "Test",
                          :user_id => 1)
    visit "/users/sign_in"
    fill_in "Email",                 :with => "admin@example.com"
    fill_in "Password",              :with => "password"
    click_button "Sign In"
    click_on "Quests"
    click_on "Add a Mission"
    click_button "Save"
    expect(page).to have_content 'errors'
  end
end
