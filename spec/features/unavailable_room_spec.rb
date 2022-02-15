feature 'can only book room once' do
  scenario 'raises an error while trying to book unavailable room' do
    visit('/')
    first('.room').click_button('Book')
    visit('/')

  
    expect{page}.to raise_error 'Unfortunately, this room is not available!'
  end
end