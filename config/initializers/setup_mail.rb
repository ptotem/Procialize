#ActionMailer::Base.smtp_settings = {
#    :enable_starttls_auto => false,
#    :address => "mail.ptemplar.com",
#    :port => 26,
#    :authentication => :login,
#    :user_name => "nilesh@ptemplar.com",
#    :password => "ptotem123"
#}


ActionMailer::Base.smtp_settings = {
    :address => "mail.procialize.net",
    :port => 25,
    :domain => "procialize.net",
    :user_name => "promotions@procialize.net",
    :password => "procialize123",
    :authentication => "plain",
    :enable_starttls_auto => true,
    :openssl_verify_mode  => 'none'
}
#Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
