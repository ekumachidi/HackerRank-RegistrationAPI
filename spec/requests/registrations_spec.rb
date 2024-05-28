require 'rails_helper'
include ActiveJob::TestHelper

describe 'RegistrationsController', type: :request do
  describe 'POST /registrations' do
    let(:username) { Faker::Name.name }
    let(:email) { Faker::Internet.email }
    let(:password) { Faker::Alphanumeric.alphanumeric(number: 10) }

    let(:params) do
      {
        username: username,
        email: email,
        password: password
      }
    end

    before { post '/registrations', params: params }
    around { |test| perform_enqueued_jobs(&test) }

    describe 'confirmation email' do
      let(:sent_email) { ActionMailer::Base.deliveries[0] }

      it 'should be sent out' do
        expect(ActionMailer::Base.deliveries.count).to eq(1)
        expect(sent_email).to be_present
      end

      it 'should be sent to the user email' do
        expect(sent_email).to be_present
        expect(sent_email.to).to eq([email])
      end

      it 'should be sent from "registration@hackerrank.com"' do
        expect(sent_email).to be_present
        expect(sent_email.from).to eq(['registration@hackerrank.com'])
      end

      it 'should be sent as BCC to "admin@hackerrank.com"' do
        expect(sent_email).to be_present
        expect(sent_email.bcc).to eq(['admin@hackerrank.com'])
      end

      it 'should have a "Reply To" field set as "admin@hacherrank.com"' do
        expect(sent_email).to be_present
        expect(sent_email.reply_to).to eq(['admin@hackerrank.com'])
      end

      it 'should have a subject "Welcome to HackerRank!"' do
        expect(sent_email).to be_present
        expect(sent_email.subject).to eq('Welcome to HackerRank!')
      end

      it 'should contain both HTML and TEXT versions' do
        expect(sent_email).to be_present
        expect(sent_email.parts.count).to eq(2)
        expect(sent_email.html_part).to be_present
        expect(sent_email.text_part).to be_present
      end

      it 'should contain correct salutation in HTML version' do
        expect(sent_email).to be_present

        email_body = (sent_email.html_part || sent_email).body.to_s

        expect(email_body).to match(/Hello #{username}/)
        expect(email_body).to match(/Thank you for registration in HackerRank!/)
      end

      it 'should contain correct salutation in TEXT version' do
        expect(sent_email).to be_present
        
        email_body = (sent_email.text_part || sent_email).body.to_s

        expect(email_body).to match(/Hello #{username}, thank you for registration in HackerRank!/)
      end
    end
  end
end