require 'minitest_helper'

describe "You can create Students" do
  include Capybara::DSL

  it "should show fixtures" do
    visit "/students"
    page.must_have_content "Ben"
  end

  it "should create students" do
    visit "/students/new"
    fill_in('First name', :with => 'John')
    fill_in('Last name', :with => 'Joe')
    click_button('Save')
    page.must_have_content "Student Was Successfully Created"
    page.must_have_content "John"
  end

end