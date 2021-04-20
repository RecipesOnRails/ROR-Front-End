class FriendNotifierMailer < ApplicationMailer
  def inform(info, recipient)
    @user = info[:user]
    @message = info[:message]
    @friend = info[:friend]

    mail(
      reply_to: "df45lka45hsyjytrf56oi86hd5s3oROR@gmail.com",
      to: recipient,
      subject: "#{@user.uid} is sending you their meal plan"
    )
  end
end
