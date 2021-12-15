require "application_system_test_case"

class PublishTest < ApplicationSystemTestCase
  setup do
    @a1 = users(:user1)
  end
  test "Publish success1" do
    visit '/login'
    fill_in "Email", with: @a1.email
    fill_in "Password", with: 'a1'
    click_on "Login"
    visit '/platform1s/new'
    fill_in "Name", with: 'youtube'
    fill_in "Link", with: 'youtube.com'
    click_on "Submit"
    visit '/platform1s/new'
    fill_in "Name", with: 'facebook'
    fill_in "Link", with: 'facebook.com'
    click_on "Submit"

    select "youtube", from: "Platform1"
    fill_in "Desc", with: 'describe'
    click_on "Publish"
    assert_text "Publish success."
  end
  
end