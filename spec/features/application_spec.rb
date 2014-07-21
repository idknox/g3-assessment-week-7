require 'spec_helper'

feature 'Homepage' do
  scenario 'Shows the welcome message' do
    visit '/'

    expect(page).to have_content 'Welcome!'
  end

  scenario "Shows name and mesg fields" do

    visit "/"

    fill_in("name", :with => "Ian")
    fill_in("msg", :with => "Hello World")
    click_button("Add Message")

    expect(page).to have_content("Hello World", "Ian")
  end

  scenario "Vistor sees all messages" do

    visit "/"

    fill_in("name", :with => "Ian")
    fill_in("msg", :with => "Hello World")
    click_button("Add Message")

    visit "/"

    fill_in("name", :with => "Jeff")
    fill_in("msg", :with => "Hello Me!")
    click_button("Add Message")

    visit "/"
    expect(page).to have_content("Ian", "Jeff", "Hello Me!", "Hello World")
  end
end