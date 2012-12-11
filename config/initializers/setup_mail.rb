#ActionMailer::Base.smtp_settings = {
#    :enable_starttls_auto => false,
#    :address => "mail.ptemplar.com",
#    :port => 26,
#    :authentication => :login,
#    :user_name => "nilesh@ptemplar.com",
#    :password => "ptotem123"
#}


ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "railscasts.com",
    :user_name            => "procialize@gmail.com",
    :password             => "ptotem123",
    :authentication       => "plain",
    #:user_name            => "railscasts",
    #:password             => "secret",
    :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
#Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?