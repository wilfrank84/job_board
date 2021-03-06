class CompanyMailer < ActionMailer::Base
  default from: "wilfrank84@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.company_mailer.new_comment.subject
  #
  def new_comment(job, comment)
    @job      = job
    @comment  = comment
    @company  = job.company

    mail to: @company.email, subject: "New comment received."
  end
end
