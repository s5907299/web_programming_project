require "application_system_test_case"

class CreatePlatformTest < ApplicationSystemTestCase
  setup do
    @a1 = users(:user1)
  end
  test "CreatePlatform success" do
    visit '/login'
    fill_in "Email", with: @a1.email
    fill_in "Password", with: 'a1'
    click_on "Login"
    click_on "Create Platform"
    fill_in "Name", with: 'youtube'
    fill_in "Link", with: 'youtube.com'
    click_on "Submit"
    assert_text "Platform was successfully created."
  end
  
end