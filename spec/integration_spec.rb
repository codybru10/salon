require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('see stylist list', {:type => :feature}) do
  it('allows user to see stylist list') do
    visit('/')
    click_link('See Stylists')
    expect(page).to have_content("Your Current Stylist")
  end

describe('add stylist', {:type => :feature}) do
  it('allows user to add stylist') do
    visit('/stylists')
    fill_in('name', :with => 'Cody')
    click_button('Add')
    expect(page).to have_content("Here are your stylists")
  end
end

end
