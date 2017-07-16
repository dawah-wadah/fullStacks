@posts.each do |post|
  json.set! post.id do
    json.title post.title
    json.id post.id
    json.description post.description
    json.author_id post.author.id
    json.author_name post.author.username
    json.totalvotes post.upvote_count - post.downvote_count
    json.main_image asset_path(post.main_image.image.url(:thumb))
    if current_user
      vote = Vote.where('voter_id = :id and voteable_id = :post and voteable_type = :type', {id: current_user.id, post: post.id, type: 'Post'})

      json.vote vote[0] ? vote[0] : nil
     else
      json.voted false
    end
  end
end
