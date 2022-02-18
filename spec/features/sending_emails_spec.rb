feature "Sending emails" do
  scenario "should send a confirmation email" do
    Pony.override_options = { :via => :test }
    sign_up_and_in
    
    expect(Mail::TestMailer.deliveries.length).to eq(1)
  end

  scenario "should send an email after creating a new listing" do
    Pony.override_options = { :via => :test }
    sign_up_and_in
    visit('/')
    click_button('Add a Listing')
    fill_in('address', with: '124 New Street')
    fill_in('description', with: '2 bedroom, one bathroom cosy log cabin with a hot tub')
    fill_in('price_per_night', with: '£150')
    fill_in('start_date', with: '2022-02-05')
    fill_in('end_date', with: '2022-02-10')
    click_button('Submit')

    expect(Mail::TestMailer.deliveries.length).to eq(3)
  end

  scenario "should send an email after a booking request" do
    Pony.override_options = { :via => :test }
    sign_up_and_in
    visit('/')
    first('.room').fill_in('date', with: '2022-02-07')
    first('.room').click_button('Book')

    expect(Mail::TestMailer.deliveries.length).to eq(5)
  end
end