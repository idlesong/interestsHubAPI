module SessionHelper
  def logged_in?
    !current_user.nil?
  end

  def current_user?(user)
    current_user == user
  end

  def group_feed_filter(posts, group)
    tag_names = []
    group.tags.each { |tag| tag_names << tag.tag }
    # logger.debug "log------:tagnames: #{tag_names.to_s}"
    group_posts = posts.joins(:tags).where("tags.tag" => tag_names)
  end

  def count_posts(tag, user)
    tag.posts.where("user_id = ?", ).count
  end

end
