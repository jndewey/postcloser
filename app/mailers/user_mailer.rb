class UserMailer < ActionMailer::Base
  default from: "hkclosingcenter@gmail.com"
  def send_mail(users, subject, items)
  	@closing_items = items
    mail(:to => users, :subject => subject)
  end

  def send_mail_assigned(users, subject)
  	@subject = subject
  	mail(:to => users, :subject => subject)
  end

  def send_mail_task(users, subject, deadline, closing)
    closing_details = Closing.find(closing)
    @closing_id = closing_details[:id]
    closing_name = closing_details[:dealname]
    @subject = subject
    @deadline = deadline
  	mail(:to => users, :subject => closing_name)
  end


end
