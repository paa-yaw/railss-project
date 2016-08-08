require "rails_helper"

RSpec.feature "User can place an order" do
  before do 
    visit "/"
  end 

  scenario "without first logging in" do
    click_link "Book a Cleaning"

    select "1", from: "Bedrooms"
    select "1", from: "Bathrooms"

    fill_in "Email", with: "user@email.com"
    fill_in "Phone number", with: "0204704427"
    fill_in "Location", with: "some address or location"
    check "I Have Carefully Read And Fully Agreed To The Terms of Service" 
    
    click_button "Book a Cleaning"

    expect(page.current_url).to eq message_url
    expect(page).to have_content "We will call you shortly to tailor our service to your needs and give you a price."
    expect(page).to have_link "Done"

    click_link "Done"

    expect(page.current_url).to eq "/"
  end
end