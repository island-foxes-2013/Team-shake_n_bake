# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ShakeNBake::Application.initialize!

require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'mini_magick'
