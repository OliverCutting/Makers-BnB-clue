feature 'Users must be signed in' do
  scenario 'Only signed in users can let/rent rooms' do
    visit('/')
    first('.room').click_button('Book')

    expect(page).to have_content 'You must be signed in to do that'
  end
end