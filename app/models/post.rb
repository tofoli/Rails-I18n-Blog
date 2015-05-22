class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user, :title, :summary, :content

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
