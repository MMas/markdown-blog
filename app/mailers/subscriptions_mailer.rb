class SubscriptionsMailer < ApplicationMailer

  default from: "subscriptions@markdown-blog.com"
  layout 'mailer'

  def subscription(subscriber, article)
    @subscriber = subscriber
    @article = article
    mail(to: @subscriber.email, subject: "New Article - #{@article.name}")
  end

end
