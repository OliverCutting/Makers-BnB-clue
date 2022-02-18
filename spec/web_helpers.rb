def sign_up_and_in
  visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')
end

def sign_out
  visit '/'
  click_button('Sign Out')
end