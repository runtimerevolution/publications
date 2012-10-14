require 'publications/core'
require 'publications/active_record'
require 'publications/railtie'

require 'publications/crud_frameworks' if Module.const_defined? :ActiveAdmin
