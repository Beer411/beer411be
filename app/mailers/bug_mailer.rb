class BugMailer < ApplicationMailer
  default from: 'no-reply@calm-scrubland-8623.herokuapp.com'
  default to: 'dvaugha1@gmail.com'

  def bugs(user, message)
    @user = user
    @message = message
    mail(subject: "Another fucking bug report", date: Time.now)
  end

end
