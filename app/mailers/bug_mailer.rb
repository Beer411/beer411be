class BugMailer < ApplicationMailer
  default from: 'no-reply@calm-scrubland-8623.herokuapp.com'
  default to: 'dvaugha1@gmail.com'

  def bugs(message)
    @message = message
    mail(subject: "Another fucking bug report", date: DateTime.now)
  end

end
