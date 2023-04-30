module Twilio
  class SmsService
    TWILIO_ACCOUNT_SID = "AC68856913e67d235a0aa68df3599b39a2"
    TWILIO_AUTH_TOKEN = "f1732ba25fafa56d03f7e5a82bbd57ad"
    TWILIO_FROM_PHONE = "+16206368352"
    TWILIO_TEST_PHONE = "+923338764656"

    def initialize(body: , to_phone_number: )
      @body = body
      @to_phone_number = to_phone_number
    end

    def call
      @client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)

      message = @client.messages
                       .create(
                         body: @body,
                         from: TWILIO_FROM_PHONE,
                         to: to(@to_phone_number)
                       )
      puts message.sid
      puts message.sid
    end

    private

    def to(to_phone_number)
      return TWILIO_TEST_PHONE if Rails.env.development?

      to_phone_number
    end
  end

end
