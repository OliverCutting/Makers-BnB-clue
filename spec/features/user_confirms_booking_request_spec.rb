feature 'Confirm booking request' do
  scenario 'Owner can see booking requests' do
    sign_up_and_in
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO bookings (room_id, date, user_id, owner_id) VALUES (2, '2022-02-07', 1, 2);")
    visit '/bookingrequests'

    expect(page).to have_content('321 Fake Lane')
  end

  scenario 'Owner can confirm booking requests' do
    sign_up_and_in
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO bookings (room_id, date, user_id, owner_id) VALUES (2, '2022-02-07', 1, 2);")
    visit('/bookingrequests')
    first('.request').click_button('Confirm')
    expect(page).not_to have_content('321 Fake Lane')
  end
end
