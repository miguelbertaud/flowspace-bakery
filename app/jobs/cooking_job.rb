class CookingJob < ApplicationJob
  queue_as :default

  after_perform do |job|
    Cookie.find_by(id: job.arguments.first).cooked!
    ActionCable.server.broadcast 'cookie_update', message: '(Your Cookie is Ready)'
  end

  def perform(cookie_id)
    Cookie.find_by(id: cookie_id)
  end
end
