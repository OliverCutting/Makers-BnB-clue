feature 'Booking a room' do
  scenario 'A user can book a room' do
    sign_up_and_in
    visit('/')
    first('.room').click_button('Book')

    expect(page).to have_content('Please confirm booking!')
  end
end
