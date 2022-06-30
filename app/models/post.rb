class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :text, presence: true, length: { maximum: 500 }
  validates :comments_counter, presence: true,
                               numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true,
                            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_posts_counter
  after_destroy :update_counter_after_delete

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def update_counter_after_delete
    author.decrement!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
