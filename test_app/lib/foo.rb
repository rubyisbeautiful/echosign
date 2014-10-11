require 'bundler'
Bundler.setup

require 'echosign'

token = Echosign::Token.obtain
agreement = Echosign::Agreement.create(token)

# this doesn't actually work like this, but should or something like it
agreement.data.documentCreationInfo.recipients.email = 'you@email.com'

agreement.send