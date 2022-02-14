feature 'Create listing' do
  scenario 'A user can create a listing' do
    visit('/newlisting')
    fill_in('address', with: '124 Fake Lane')
    click_button('Submit')

    expect(page).to have_content('124 Fake Lane')
  end
end
