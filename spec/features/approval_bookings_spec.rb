feature 'Approving a booking' do
  scenario 'approves for booking' do
    sign_up_and_in
    visit('/')
    first('.room').click_button('Book')

    expect(page).to have_content('Please confirm booking!')

    click_button('Yes')
    expect(page).to have_content('Thanks for booking!')
  end
end