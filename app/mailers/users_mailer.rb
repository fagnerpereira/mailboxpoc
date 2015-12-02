class UsersMailer < ApplicationMailer

  def instructions(user)
    @mailgun = user.mailgun
    mail(to: user.email, subject: 'Bem vindo')
  end
end