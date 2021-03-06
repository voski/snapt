# Schema Information

## Users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
email           | string    | not null, unique
username        | string    | not null
private         | boolean   | not null
password_digest | string    | not null
session_token   | string    | not null, unique

## Photos
column name | data type | details
------------|-----------|-----------------------
id          | integer    | not null, primary key
author_id   | integer    | not null, foreign key (references users)
public_id   | string     | not null, used for cloudinary
coordinates | array, int | used for cropping

## Likes
column name | data type | details
------------------|-----------|-----------------------
id                | integer   | not null, primary key
liker_id          | integer   | not null, foreign key (references users)
photo_id          | integer   | not null, foreign key (references photo)
                  |           | index [:liker_id, photo_id], unique
## Comments
column name    | data type | details
---------------|-----------|-----------------------
id             | integer   | not null, primary key
author_id      | integer   | not null, foreign key (references users)
photo_id       | integer   | not null, foreign key (references photos)
content        | text      | not null, max length 140
timestamps     | date time | not null

## follows
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
followee_id | integer   | not null, foreign key (references users)
follower_id | integer   | not null, foreign key (references users)
            |           | index [:folowee_id, follower_id], unique

## Mentions
column name | data type | details
------------------|-----------|-----------------------
id                | integer   | not null, primary key
user_id           | integer   | not null, foreign key (references users)
comment_id        | integer   | not null, foreign key (references comments)
                  |           | index [:user_id, comment_id], unique

## Tags
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
label       | string    | not null, unique

## Taggings
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
photo_id    | integer   | not null, foreign key (references posts)
tag_id      | integer   | not null, foreign key (references tags)
            |           | index [:photo_id, tag_id], unique
