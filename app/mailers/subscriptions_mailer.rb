class SubscriptionsMailer < ApplicationMailer

  def subscription(subscriber, article)
    @subscriber = subscriber
    @article = article
    mail(to: @subscriber.email, subject: "New Article - #{@article.name}")
  end

end
