OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '3912463242144339', '4824ff9f137e9999ebb8988d33f8b6fd'
    provider :google_oauth2, '297338787597-fcht1sr5pvs0miki7tec6dlifq5l4emp.apps.googleusercontent.com', 'mWWYBH7ixak8dN0aib2AbmJm'
end
