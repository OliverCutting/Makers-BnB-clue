feature 'can only book room once' do
  scenario 'raises an error while trying to book unavailable room' do
    sign_up_and_in
    visit('/')
    first('.room').fill_in('date', with: '2022-02-07')
    click_button('Book', match: :first)
    visit('/')
    first('.room').fill_in('date', with: '2022-02-07')
    click_button('Book', match: :first)

    expect(page).to have_content "Unfortunately, this room is not available on this date!"
  end
end