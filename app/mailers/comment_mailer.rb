class CommentMailer < ApplicationMailer
  def comment_mail(comment, users)
    @comment = comment
    @users = users
    @email = @users.pluck(:email)


    mail to: @email, subject: "シフトにコメントが追加されました"
  end
end
