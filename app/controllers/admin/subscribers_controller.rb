class Admin::SubscribersController < Admin::ApplicationController

  def index
    @subscribers = Subscriber.all.page(params[:page]).per(10)
  end

  def destroy
    @subscriber = Subscriber.find(params[:id])
    @subscriber.destroy
    redirect_to admin_subscribers_url, :notice => "Successfully destroyed subscriber."
  end

end
