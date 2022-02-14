feature 'Test page' do
  scenario 'It has a test page' do
    visit('/test_page')

    expect(page).to have_content('Test page')
  end
end
