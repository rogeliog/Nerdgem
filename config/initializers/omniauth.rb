Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'bc3205d05f719bec84a2', '21c3bad4733b2111aa61b4d2544bf9b13995ea88'
end
