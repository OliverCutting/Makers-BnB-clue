feature 'Not approving a booking' do
  scenario 'does not approve for booking' do
    sign_up_and_in
    visit('/')
    first('.room').click_button('Book')

    expect(page).to have_content('Please confirm booking!')

    click_button('No')
    expect(page).to have_content('The booking is not approved')
  end
end