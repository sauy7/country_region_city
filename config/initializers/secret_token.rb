# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Although this is not needed for an api-only application, rails4 
# requires secret_key_base ()or secret_token) to be defined, otherwise an
# error is raised.
CountryRegionCity::Application.config.secret_key_base = ENV['COUNTRY_REGION_CITY_SECRET_KEY_BASE']
