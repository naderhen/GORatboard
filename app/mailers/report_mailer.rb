class ReportMailer < ActionMailer::Base
  
  default :from => "naderhen@gmail.com"  
  
  
  
  def distribute_report(report,user) 
    @report = report
    @user = user
   
    mail(:to => user.email, :subject=>"Testing")
  end
end
