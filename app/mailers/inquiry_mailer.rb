class InquiryMailer < ApplicationMailer
  def send_mail(group,title,content)
    @content = content
    @title = title
    group_users_mail = group.users.pluck(:email)
    owner_email = User.find(group.owner_id).email
    #group_users_mail.delete(owner_email)
    mail(
      from: owner_email,
      to:   group_users_mail,
      subject: @title
    )
  end
end
