class SubscriptionsController < ApplicationController
  def create
    tag = Tag.find(params[:tag_id])
    current_user.subscribe(tag)
    user = User.find(tag.user_id)
    redirect_to user
  end

  def destroy
    tag = Tag.find(params[:tag_id])
    current_user.unsubscribe(tag)
    user = User.find(tag.user_id)
    redirect_to user
  end
end
