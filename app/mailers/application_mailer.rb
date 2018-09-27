class ApplicationMailer < ActionMailer::Base
  include ApplicationHelper

  default from:  'no-reply@eureka-caffee.com'
  layout 'mailer'
end
