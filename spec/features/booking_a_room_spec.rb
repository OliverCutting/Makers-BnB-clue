feature 'Booking a room' do
  scenario 'A user can book a room' do
    visit('/')
    first('.room').click_button('Book')

    expect(page).to have_content('Thank you for booking!')
  end
end
