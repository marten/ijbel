# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ijbel_session',
  :secret      => 'f13730f09fc927bb2a8e489499727dab3b875f867536de86f3db4858fef90ac8d4ffef5c334239db5bb212a603be990f4a210190f55ecd0d4f73a2386688df0f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
