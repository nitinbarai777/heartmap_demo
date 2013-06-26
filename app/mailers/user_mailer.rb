class UserMailer < ActionMailer::Base
  default :from => "'Notification' <nitinbarai.virtueinfo@gmail.com>"

  def registration_confirmation(email, body)
    mail(:to => "#{email}", :subject => t("general.new_registration"), :body => body, :content_type => "text/html")
  end

  def forgot_password_confirmation(email,new_pass, body)
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => "#{email}", :subject => t("general.password_reset"), :body => body, :content_type => "text/html")
  end
end