OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1481322482154378', 'df9c578eca4b615765d57184184042e0'
end