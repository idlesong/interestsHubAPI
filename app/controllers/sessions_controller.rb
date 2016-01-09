class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/admin'
    else
      redirect_to '/login'
    end
  end

  def show
    @user = User.find(current_user.id)

    sources_tags = current_user.subscriptions.select(:tag_id)
    posts_ids = Post.joins(:tags).where('tags.id' => sources_tags)

    @feed_items = Post.where(id: posts_ids)

    # @all_posts = Post.all
    # logger.debug "log------:feed_items: #{@feed_items}"
    # logger.debug "log------:all_posts: #{@all_posts}"

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
