Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :google_oauth2, Rails.application.secrets.google_client_id, Rails.application.secrets.google_client_secret, {
    name: "google",
    scope: "email, profile",
    image_aspect_ratio: "square",
    image_size: 50# ,
    # prompt: 'consent'
  }
end
