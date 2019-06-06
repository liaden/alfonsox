# frozen_string_literal: true

# Some useful path constants
ALFONSOX_LIB_PATH = __dir__
ALFONSOX_RESOURCES_PATH = "#{__dir__}/../resources"
ALFONSOX_DICTIONARIES_PATH = "#{ALFONSOX_RESOURCES_PATH}/dictionaries"

require 'alfonsox/version'
require 'alfonsox/spellchecker/dictionaries'
require 'alfonsox/spellchecker/main'

# Alfonso X module
module AlfonsoX; end
