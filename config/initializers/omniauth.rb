OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE # not secure
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['fb_app_id'], ENV['fb_secret']
end