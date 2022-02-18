# require 'mailer'

# describe Mailer do
#   describe '.registrationconfirmation' do
#     it 'sends an email to confirm registration' do
#       Pony.override_options = { :via => :test }
#       Mailer.registrationconfirmation('fake@email.com')
#       expect(Mail::TestMailer.deliveries.length).to eq(1)
#     end
#   end
# end
