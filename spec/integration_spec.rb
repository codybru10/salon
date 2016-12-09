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

end
