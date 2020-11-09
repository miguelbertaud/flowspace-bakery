class CookieStatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from "cookie_update"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
