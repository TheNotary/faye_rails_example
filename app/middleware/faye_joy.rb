# This is an example Faye extension that simply tacks on 
# a key/value to all messages sent to channel /0001
# This class is enabled in config/application.rb

class FayeJoy
  def incoming(message, callback)
    # Let non-subscribe messages through

    add_joy!(message) if chat_message?(message) 

    return callback.call(message) unless message['channel'] == '/meta/subscribe'

    return callback.call(message) unless message['subscription'] == '/data' || message['subscription'] == '/*' || message['subscription'] == '/**'

    

    # Call the server back now we're done
    callback.call(message)
  end

  def chat_message?(message)
    message['channel'] == "/0001"
  end

  def add_joy!(message)
    message['data']['FayeJoy'] = "Here's some joy from an extension!"
  end
end

