require 'net/http'
require 'json'
require 'uri'

module Rebay
  class Api
    EBAY_US = 0
  
    def self.app_id= app_id
      @@app_id = app_id
    end
    
    def self.app_id
      @@app_id
    end

    def self.base_url= base_url
      @@base_url = base_url
    end
    
    def self.base_url
      @@base_url
    end
      
    def self.configure
      yield self if block_given?
    end
    
    protected
    def get_json_response(url)
      Rebay::Response.new(JSON.parse(Net::HTTP.get_response(URI.parse(url)).body))
    end
    
    def build_rest_payload(params)
      payload = ''
      unless params.nil?
        params.keys.each do |key|
          payload += URI.escape "&#{key}=#{params[key]}"
        end
      end
      return payload
    end
  end
end