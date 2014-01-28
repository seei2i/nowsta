class JobMailer < ActionMailer::Base
  default from: "5163137843"

  def work_confirmation(mailuser)
    @mailuser = mailuser

    mail to: mailuser.email, subject: "Event Confirmation", bcc: ["justin@hitplaylabs.com"] 

  end
end
