OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '3912463242144339', '4824ff9f137e9999ebb8988d33f8b6fd'
    provider :google_oauth2, '297338787597-meo7tkhufpm83pf6sn0s3hglq2i5e1en.apps.googleusercontent.com', 'xNcjyuHNGYMMIF125PVwIZ7U'
end
