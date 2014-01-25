require 'httparty'

class Segment_api
  include HTTParty
  debug_output $stderr
  base_uri 'api2.segment.io'
end