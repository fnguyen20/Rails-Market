module ListingsHelper
  def form_route(source)
    return create_listing_path if source == 'new'
    return topic_listing_path(topic_id: @topic.id, id: @listing.id) if source == 'edit'
  end

  def form_action(source)
    return 'post' if source == 'new'
    return 'put' if source == 'edit'
  end
end
