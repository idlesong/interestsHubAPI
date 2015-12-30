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
    # @admin_tag_groups = @user.groups
    # linux_group = @user.groups.find_by_name("LinuxWorld")
    # # tag_names = []
    # # linux_group.tags.each {|tag| tag_names << tag.tag}

    @feed_items = current_user.feed

    # @grouped_posts = @group_names =[]
    #
    # i = 0
    # @user.groups.each do |group|
    #   tag_names = []
    #   group.tags.each { |tag| tag_names << tag.tag }
    #   # logger.debug "log------:tagnames: #{tag_names.to_s}"
    #   # group_posts = @feed_items.inside_group(tag_names)
    #   group_posts = @feed_items.joins(:tags).where("tags.tag" => tag_names)
    #   @grouped_posts[i] = group_posts
    #   # @group_names[i] = group.name
    #   i+=1
    # end
    # @linux_posts = @grouped_posts[0]

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
