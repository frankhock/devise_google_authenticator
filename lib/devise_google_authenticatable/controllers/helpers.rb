module DeviseGoogleAuthenticator
  module Controllers # :nodoc:
    module Helpers # :nodoc:
      def google_authenticator_qrcode(user, app_title)
        data = "otpauth://totp/#{username_from_email(user.email)}@#{app_title}?secret=#{user.gauth_secret}"
        data = Rack::Utils.escape(data)
        url = "https://chart.googleapis.com/chart?chs=200x200&chld=M|0&cht=qr&chl=#{data}"
      end
      
      def username_from_email(email)
        (/^(.*)@/).match(email)[1]
      end
      
    end
  end
end