class UserMailer < ActionMailer::Base
  default from: "jndewey@gmail.com"
  def send_mail(users, subject, items)
  	@closing_items = items
    mail(:to => users, :subject => subject)
  end

  def send_mail_assigned(users, subject)
  	@subject = subject
  	mail(:to => users, :subject => subject)
  end

  def send_mail_task(users, subject, deadline, closing)
    @subject = subject
    @deadline = deadline  
    @closing = closing
  	mail(:to => users, :subject => 'closing')
  end


end
