OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do

  #pagender
  provider :facebook, FACEBOOK_API, FACEBOOK_SECRET
  provider :twitter, TWITTER_API, TWITTER_SECRET 
  provider :google_oauth2, GOOGLE_API, GOOGLE_SECRET
  provider :linkedin, LINKEDIN_CONSUMER_KEY, LINKEDIN_CONSUMER_SECRET

end
