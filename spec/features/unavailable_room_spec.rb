feature 'can only book room once' do
  scenario 'does not allow while trying to book unavailable room' do
    sign_up_and_in
    visit('/')
    click_button('Book', match: :first)
    click_button('Yes')
    visit('/')
    click_button('Book', match: :first)
    click_button('Yes')
    

    expect(page).to have_content "Unfortunately, this room is not available!"
  end
end