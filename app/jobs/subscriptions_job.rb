class SubscriptionsJob < ActiveJob::Base
  include Sidekiq::Worker

  def self.perform(article)
    @subscribers = Subscriber.all
    if @subscribers.any?
      @subscribers.collect do |subscriber|
        SubscriptionsMailer.subscription(subscriber, article).deliver
      end
    end
  end

end
