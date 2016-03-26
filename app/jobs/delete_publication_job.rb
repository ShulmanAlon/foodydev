class DeletePublicationJob < ActiveJob::Base
  queue_as :default
  require ENV['push_path']

  def perform(pub_id)
    sleep(1) while !Publication.exists?(pub_id)
    pub = Publication.find(pub_id)
    Rails.logger.debug "#{self.class.name}: I'm performing my job with arguments: #{pub}"
    pushDelete(pub)
    pub.destroy if pub.ending_date==0
  rescue => e
    Rails.logger.warn "Unable to find publication, will ignore: #{e}"
  end

protected
  def pushDelete(pub)
    push = Push.new(pub)
    Rails.logger.debug push.delete
  rescue => e
    Rails.logger.warn "Unable to push, will ignore: #{e}"
  end
end
