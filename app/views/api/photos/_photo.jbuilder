json.id photo.id
json.public_id photo.public_id
json.title photo.title
json.time_ago time_ago_in_words(photo.created_at)
json.coordinates photo.coordinates
json.likes_count photo.likes_count
json.created_at photo.created_at

json.comments do
  json.partial! '/api/comments/comments', comments: photo.comments
end

json.author photo.author, :id, :username, :profile_pic_pid

json.likes do
  json.array! photo.likes do |like|
    json.id like.id
    json.liker do
      json.id like.liker.id
      json.username like.liker.username
    end
  end
end
