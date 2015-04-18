class SubscriptionsJob < ActiveJob::Base

  rescue_from(ErrorLoadingSite) do
    retry_job wait: 5.minutes, queue: :subscriptions
  end

  def perform(article)
    @subscribers = Subscriber.all
    if @subscribers.any?
      @subscribers.collect do |subscriber|
        SubscriptionsMailer.subscriptions(subscriber, article).deliver
      end
    end
  end

end
