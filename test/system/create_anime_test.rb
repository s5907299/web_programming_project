require "application_system_test_case"

class CreateAnimeTest < ApplicationSystemTestCase
  setup do
    @a1 = users(:user1)
  end

  test "CreateAnime success" do
    visit '/login'
    fill_in "Email", with: @a1.email
    fill_in "Password", with: 'a1'
    click_on "Login"
    click_on "Create Anime"
    fill_in "Name", with: 'name'
    fill_in "Synosis", with: 'synosis'
    fill_in "Day in week", with: '2'
    fill_in "Episode", with: '3'
    click_on "Submit"
    assert_text "Anime was successfully created."
  end
  test "CreateAnime error:day out off lenght1" do
    visit '/login'
    fill_in "Email", with: @a1.email
    fill_in "Password", with: 'a1'
    click_on "Login"
    click_on "Create Anime"
    fill_in "Name", with: 'name'
    fill_in "Synosis", with: 'synosis'
    fill_in "Day in week", with: '9'
    fill_in "Episode", with: '3'
    click_on "Submit"
    assert_text "Anime was not successfully created."
  end
  test "CreateAnime error:day out off lenght2" do
    visit '/login'
    fill_in "Email", with: @a1.email
    fill_in "Password", with: 'a1'
    click_on "Login"
    click_on "Create Anime"
    fill_in "Name", with: 'name'
    fill_in "Synosis", with: 'synosis'
    fill_in "Day in week", with: '-1'
    fill_in "Episode", with: '3'
    click_on "Submit"
    assert_text "Anime was not successfully created."
  end
  test "CreateAnime error:day is string" do
    visit '/login'
    fill_in "Email", with: @a1.email
    fill_in "Password", with: 'a1'
    click_on "Login"
    click_on "Create Anime"
    fill_in "Name", with: 'name'
    fill_in "Synosis", with: 'synosis'
    fill_in "Day in week", with: 'sdfkndfk'
    fill_in "Episode", with: '3'
    click_on "Submit"
    assert_text "Anime was not successfully created."
  end
  test "CreateAnime error:episode out off lenght" do
    visit '/login'
    fill_in "Email", with: @a1.email
    fill_in "Password", with: 'a1'
    click_on "Login"
    click_on "Create Anime"
    fill_in "Name", with: 'name'
    fill_in "Synosis", with: 'synosis'
    fill_in "Day in week", with: '6'
    fill_in "Episode", with: '-3'
    click_on "Submit"
    assert_text "Anime was not successfully created."
  end
  test "CreateAnime error:spisode is string" do
    visit '/login'
    fill_in "Email", with: @a1.email
    fill_in "Password", with: 'a1'
    click_on "Login"
    click_on "Create Anime"
    fill_in "Name", with: 'name'
    fill_in "Synosis", with: 'synosis'
    fill_in "Day in week", with: '0'
    fill_in "Episode", with: 'omovod'
    click_on "Submit"
    assert_text "Anime was not successfully created."
  end

end