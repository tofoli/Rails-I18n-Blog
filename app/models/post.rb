class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates_presence_of :user, :title, :summary, :content
  validates_length_of :title, in: 5..255
  validates_length_of :summary, in: 30..500
  validates_length_of :content, in: 50..500

  scope :active, -> { where(active: true) }
  scope :from_user, ->(user) { joins(:user).where(user_id: user.id) }

  scope :search, ->(query, page=1) {
    query = "%#{query}%"
    posts = Post.arel_table

    where(posts[:title].matches(query).or(posts[:content].matches(query))).
        active.
        page(page).per(3)
  }
end
