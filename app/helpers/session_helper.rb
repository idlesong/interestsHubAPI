module SessionHelper

  def group_feed_filter(posts, group)
    tag_names = []
    group.tags.each { |tag| tag_names << tag.tag }
    # logger.debug "log------:tagnames: #{tag_names.to_s}"
    group_posts = posts.joins(:tags).where("tags.tag" => tag_names)
  end

end
