class ThanksMailer < ApplicationMailer
  default from: 'notificatoin@example.com'

  def welcome
      @user = params[:user]
      mail(to: @user.email, subject: "ようこそ。おいでまし。")
  end
end
