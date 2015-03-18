class BugMailer < ApplicationMailer
  default from: 'no-reply@calm-scrubland-8623.herokuapp.com'
  default to: 'dvaugha1@gmail.com'

  def bugs(user)
    @user = user
    mail(subject: "Another fucking bug report")
  end

end
