require "application_system_test_case"

class RegisterTest < ApplicationSystemTestCase
  setup do
    @a1 = users(:user1)
    @a2 = users(:user2)
  end

  test "register success" do
    visit '/register'
    fill_in "Email", with: 'new_email'
    fill_in "Name", with: 'new_name'
    fill_in "Password", with: 'a1'
    fill_in "Password confirmation", with: 'a1'
    click_on "Create User"
    assert_text "User was successfully created."
  end
  test "same email" do
    visit '/register'
    fill_in "Email", with: @a1.email
    fill_in "Name", with: @a1.name
    fill_in "Password", with: 'a2'
    fill_in "Password confirmation", with: 'a2'
    click_on "Create User"
    assert_text "Email has already been taken"
  end
  test "error too short" do
    visit '/register'
    fill_in "Email", with: 'a'
    fill_in "Name", with: 'a'
    fill_in "Password", with: 'a1'
    fill_in "Password confirmation", with: 'a1'
    click_on "Create User"
    assert_text "Name is too short"
  end
  test "Password not match" do
    visit '/register'
    fill_in "Email", with: @a2.email
    fill_in "Name", with: @a2.name
    fill_in "Password", with: 'a1'
    fill_in "Password confirmation", with: 'a2'
    click_on "Create User"
    assert_text "Password confirmation doesn't match Password and Password confirmation doesn't match Password"
  end
end