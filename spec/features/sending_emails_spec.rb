# feature "Sending emails" do
#   scenario "should send a confirmation email" do
#     Pony.override_options = { :via => :test }
#     sign_up_and_in
#     expect(Mail::TestMailer.deliveries.length).to eq(1)
#   end
# end