require 'rubygems'
require 'casserver/authenticators/base'
require 'active_record'
require 'httparty'


# 定制的Rails Devise 验证
# 直接访问远程
module CASServer
  module Authenticators
    class RailsDevise < CASServer::Authenticators::Base
      def validate(credentials)
        read_standard_credentials(credentials)
        return false if @password.blank? || @username.blank?
        url = "http://coiex.io/internal_interfaces/is_password_valid?email=#{@username}&password=#{@password}"
        result = HTTParty.get(url).body.to_s == 'true' rescue false
        #logger.info "====== result: #{result}"
        return result
      end
    end
  end
end
