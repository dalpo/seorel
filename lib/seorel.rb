module Seorel
end

###
# Load Seorel components

require 'seorel/config'

require "seorel/engine"

require "seorel/model/base"
require "seorel/model/instance_methods"
require "seorel/model/class_methods"

require "seorel/controller/instance_methods"
require "seorel/controller/class_methods"

require "seorel/seorelify"
