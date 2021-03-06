  @posts.each do |post|
    json.set! post.id do
      json.title post.title
      json.id post.id
      json.user_id post.user.id
      json.user_name post.user.username
      json.main_image asset_path(post.main_image.image.url)
      if current_user
        vote = Vote.where('user_id = :id and voteable_id = :post and voteable_type = :type', {id: current_user.id, post: post.id, type: 'Post'})

        json.vote vote[0] ? vote[0] : nil
       else
        json.voted false
      end
    end
  end
