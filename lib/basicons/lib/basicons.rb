require 'basicons/version'
require 'basicons/basicon'
require 'json'

module Basicons
  json_data = File.read("#{File.dirname(__FILE__)}/assets/data.json")
  SVG_DATA = JSON.parse(json_data).freeze
end
