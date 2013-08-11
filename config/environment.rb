# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ShakeNBake::Application.initialize!

require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'mini_magick'

CarrierWave.configure do |config|
  config.permissions = 0666
  config.directory_permissions = 0777
  config.storage = :file
end

require 'will_paginate/array'

