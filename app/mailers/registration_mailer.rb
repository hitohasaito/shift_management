class RegistrationMailer < ApplicationMailer
  def registration_mail(user)
    @user = user
    @email = @user.email

    mail to: @email, subject: "ユーザー登録のお知らせ"
  end
end
