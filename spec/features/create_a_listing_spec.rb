feature 'Create listing' do
  scenario 'A user can create a listing' do
    visit('/newlisting')
    fill_in('address', with: '124 New Street')
    fill_in('description', with: '2 bedroom, one bathroom cosy log cabin with a hot tub')
    fill_in('price_per_night', with: '£150')
    click_button('Submit')

    expect(page).to have_content('124 New Street')
    expect(page).to have_content('2 bedroom, one bathroom cosy log cabin with a hot tub')
    expect(page).to have_content('£150')
  end
end
