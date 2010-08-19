# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_presentation_session',
  :secret      => '94971e541dfc74195ad6fda335c20b1a3d567d3212103c37d72310d1a697187cdf9c926ef16f5647455fd1d7bda67f790a52bd02286b0a458083ddb0d8ce767f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
