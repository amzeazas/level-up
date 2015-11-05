require 'rails_helper'

describe "the add a quest process" do
  it "adds a new quest" do
    user = User.create(:email => "admin@example.com",
                        :username => "admin",
                        :password => "password",
                        :admin? => true)
    visit "/users/sign_in"
    fill_in "Email",                 :with => "admin@example.com"
    fill_in "Password",              :with => "password"
    click_button "Sign In"
    click_on "Quests"
    click_on "Add a Quest"
    fill_in 'Title', :with => "Test"
    click_on 'Save'
    expect(page).to have_content "Test"
  end

  it "gives error when no title is entered" do
    user = User.create(:email => "admin@example.com",
                        :username => "admin",
                        :password => "password",
                        :admin? => true)
    visit "/users/sign_in"
    fill_in "Email",                 :with => "admin@example.com"
    fill_in "Password",              :with => "password"
    click_button "Sign In"
    click_on "Quests"
    click_on "Add a Quest"
    click_on "Save"
    expect(page).to have_content 'errors'
  end
end
