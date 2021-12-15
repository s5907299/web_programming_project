require "application_system_test_case"

class LoginsTest < ApplicationSystemTestCase
  setup do
    @a1 = users(:user1)
    @a2 = users(:user2)
  end

  test "a1 success" do
    visit '/login'
    fill_in "Email", with: @a1.email
    fill_in "Password", with: 'a1'
    click_on "Login"
    assert_text "Login success"
  end
  test "a2 success" do
    visit '/login'
    fill_in "Email", with: @a2.email
    fill_in "Password", with: 'a2'
    click_on "Login"
    assert_text "Login success"
  end

  test "a1 fail" do
    visit '/login'
    fill_in "Email", with: @a1.email
    fill_in "Password", with: 'abc'
    click_on "Login"
    assert_text "Login fail"
  end
  test "a2 fail" do
    visit '/login'
    fill_in "Email", with: @a2.email
    fill_in "Password", with: 'abc'
    click_on "Login"
    assert_text "Login fail"
  end
end