class SmsJob < ApplicationJob
  queue_as :default

  def perform(id)
    @pupil = Pupil.find(id)
    send_sms
  end

  def send_sms
      t = Time.now.strftime("%Y-%m-%d %H:%M:%S")

      #client = Savon.client(wsdl: "http://api.itnewsletter.co.il/webServices/WebServiceSMS.asmx?wsdl")
      client = Savon.client(wsdl: "https://sapi.itnewsletter.co.il/webServices/WebServiceSMS.asmx?wsdl",ssl_verify_mode: :none)

      params = {} #Array.new
      params["un"] = ENV["SMS_USER_NAME"]
      params["pw"] = ENV['SMS_PASSWORD']
      params["accid"] = ENV['SMS_ACCOUNT']
      params["sysPW"] = "itnewslettrSMS"
      params["t"] = t
      params["txtUserCellular"] = "0737296060"
      params["destination"] = @pupil.invited_phone
      #params["txtSMSmessage"] = "שלום #{@pupil.full_name} הנני להזמינך לפגישת מחזור ל בית הספר נר עציון לפרטים יש ללחוץ כאן: http://bit.ly/nerezion נבקשך להרשם וכן להזמין חברים נוספים תודה."
      params["txtSMSmessage"] = "שלום #{@pupil.full_name} בית הספר נר עציון מזמין אותך לפגישת מחזור ל׳, לפרטים נא כאן: http://bit.ly/nerezion נבקשך להרשם וכן להזמין חברים נוספים תודה."
      params["dteToDeliver"] = ""
      params["txtAddInf"] = "LocalMessageID"

      @response = client.call(:send_sms_to_recipients, message: params)

     @result = @response.body[:send_sms_to_recipients_response][:send_sms_to_recipients_result].to_i

  end
end
