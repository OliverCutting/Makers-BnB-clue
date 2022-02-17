feature 'Booking a room' do
  scenario 'A user can book a room' do
    sign_up_and_in
    visit('/')
    first('.room').fill_in('date', with: '2022-02-07')
    first('.room').click_button('Book')

    expect(page).to have_content('Thank you for booking 123 Fake Lane on 2022-02-07!')
  end
end
