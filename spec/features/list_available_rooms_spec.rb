feature 'List available rooms' do
  scenario 'it lists all available rooms' do
    visit('/')

    expect(page).to have_content('123 Fake Lane')
  end
end
