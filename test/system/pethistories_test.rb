require "application_system_test_case"

class PethistoriesTest < ApplicationSystemTestCase
  setup do
    @pethistory = pethistories(:one)
  end

  test "visiting the index" do
    visit pethistories_url
    assert_selector "h1", text: "Pethistories"
  end

  test "creating a Pethistory" do
    visit pethistories_url
    click_on "New Pethistory"

    fill_in "Date", with: @pethistory.date
    fill_in "Description", with: @pethistory.description
    fill_in "Height", with: @pethistory.height
    fill_in "Pet", with: @pethistory.pet_id
    fill_in "Weight", with: @pethistory.weight
    click_on "Create Pethistory"

    assert_text "Pethistory was successfully created"
    click_on "Back"
  end

  test "updating a Pethistory" do
    visit pethistories_url
    click_on "Edit", match: :first

    fill_in "Date", with: @pethistory.date
    fill_in "Description", with: @pethistory.description
    fill_in "Height", with: @pethistory.height
    fill_in "Pet", with: @pethistory.pet_id
    fill_in "Weight", with: @pethistory.weight
    click_on "Update Pethistory"

    assert_text "Pethistory was successfully updated"
    click_on "Back"
  end

  test "destroying a Pethistory" do
    visit pethistories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pethistory was successfully destroyed"
  end
end
