require "rails_helper"

RSpec.describe FriendNotifierMailer, type: :mailer do
  describe 'inform' do
    user = User.create(
      uid: "df45lka45hsyjytrf56oi86hd5s3o",
      token: "23904yfhdlskfhh9s"
    )

    email_info = {
      user: user,
      friend: "Bob Gu",
      message: "McDonalds every day, Super Size Special."
    }

    let(:mail) { FriendNotifierMailer.inform(email_info, 'bobgu@aol.com')}

    it 'renders the headers' do
      expect(mail.subject).to eq('df45lka45hsyjytrf56oi86hd5s3o is sending you their meal plan')
      expect(mail.to).to eq(['bobgu@aol.com'])
      expect(mail.from).to eq(['ROR@gmail.com'])
      expect(mail.reply_to).to eq(['df45lka45hsyjytrf56oi86hd5s3oROR@gmail.com'])
    end

    it 'renders the body' do
      expect(mail.text_part.body.to_s).to include('Hello Bob Gu')
      expect(mail.text_part.body.to_s).to include('df45lka45hsyjytrf56oi86hd5s3o has sent you a meal plan: McDonalds every day, Super Size Special.')

      expect(mail.html_part.body.to_s).to include('Hello Bob Gu')
      expect(mail.html_part.body.to_s).to include('df45lka45hsyjytrf56oi86hd5s3o has sent you a meal plan: McDonalds every day, Super Size Special.')

      expect(mail.body.encoded).to include('Hello Bob Gu')
      expect(mail.body.encoded).to include('df45lka45hsyjytrf56oi86hd5s3o has sent you a meal plan: McDonalds every day, Super Size Special.')
    end
  end
end
