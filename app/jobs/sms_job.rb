class SmsJob < ApplicationJob
  queue_as :default

  def perform(id)
    @pupil = Pupil.find(id)
    #send_sms
  end

  def send_sms

      un = "test5"
      pw = "56789"
      accid = "362"
      sysPW = "itnewslettrSMS"
      t = Time.now.strftime("%Y-%m-%d %H:%M:%S")

      client = Savon.client(wsdl: "http://api.itnewsletter.co.il/webServices/WebServiceSMS.asmx?wsdl")
      params = {} #Array.new
      params["un"] = un
      params["pw"] = pw
      params["accid"] = accid
      params["sysPW"] = "itnewslettrSMS"
      params["t"] = t
      params["txtUserCellular"] = "0509530093"
      params["destination"] = @pupil.invited_phone
      params["txtSMSmessage"] = "שלום #{@pupil.full_name} הנני להזמינך לפגישת מחזור ל בית הספר נר עציון לפרטים יש ללחוץ כאן: http://bit.ly/1Q6y0X0"
      params["dteToDeliver"] = ""
      params["txtAddInf"] = "LocalMessageID"

      @response = client.call(:send_sms_to_recipients, message: params)

     @result = @response.body[:send_sms_to_recipients_response][:send_sms_to_recipients_result].to_i

  end
end
