class Frontend::SubscriptionsController < Frontend::ApplicationController

  def subscribe
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      redirect_to :back, notice: "Successfully subscibed - #{@subscriber.email}."
    else
      redirect_to frontend_root_url, alert: "Could not subscibe - #{@subscriber.email}."
    end
  end

  def unsubscribe
    @subscriber = Subscriber.find(params[:id])
    @email = @subscriber.email
    @subscriber.destroy
    redirect_to frontend_root_url, :notice => "Successfully unsubscribed - #{@email}."
  end

  private

    def subscriber_params
      params.require(:subscriber).permit(:email)
    end

end
