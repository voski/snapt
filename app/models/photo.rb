# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  author_id   :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#  public_id   :string           not null
#  title       :text             default("Title"), not null
#  coordinates :integer          default([]), is an Array
#  likes_count :integer          default(0)
#

class Photo < ActiveRecord::Base
  validates :author_id, :public_id, :title, presence: true

  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, dependent: :destroy
  has_many :comment_authors, through: :comments, source: :author
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :liker

  default_scope { order("created_at DESC") }

  def like_count
    self.likes.count(:all)
  end

end
