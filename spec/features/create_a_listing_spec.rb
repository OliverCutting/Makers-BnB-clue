feature 'Create listing' do
  scenario 'A user can create a listing' do
    visit('/newlisting')
    fill_in('address', with: '124 New Street')
    fill_in('description', with: '2 bedroom, one bathroom cosy log cabin with a hot tub')
    fill_in('price_per_night', with: '£150')
    fill_in('start_date', with: '2022-02-05')
    fill_in('end_date', with: '2022-02-10')
    click_button('Submit')

    expect(page).to have_content('124 New Street')
    expect(page).to have_content('2 bedroom, one bathroom cosy log cabin with a hot tub')
    expect(page).to have_content('£150')
    expect(page).to have_content('Available between: 2022-02-05 and 2022-02-10')
  end
end
