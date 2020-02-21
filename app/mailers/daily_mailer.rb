class DailyMailer < ApplicationMailer
  default from: 'notificatoin@example.com'

  def send
    mail(bcc: User.pluck(:email), subject:"ご連絡")
  end
end
