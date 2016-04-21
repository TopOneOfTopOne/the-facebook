# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.smtp_settings = {
    address: 'smtp.sendgrid.net',
    domain: 'heroku.com',
    port: 587,
    authentication: :plain,
    enable_starttls_auto: true,
    user_name: ENV['mail_server_user_name'],
    password: ENV['mail_server_password']
}
