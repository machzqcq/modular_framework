require 'watir-webdriver'
require 'rspec'
require 'require_all'
require 'saucelabs'
require 'nokogiri'

require './lib/data_helper'
require './features/support/modules/business_modules'

OR = YAML.load_file './lib/config/object_repository.yml'


World DataHelper
World Keywords




