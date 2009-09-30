# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_athens_session',
  :secret      => 'c20fb0c1f9c6c69db9b5bd537d64cbfae910b17815394eab806241bc58019647c3d20827709357d2ba2a1c42bf3223da92697a1bdb0a2223bce2b1474f966eab'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
