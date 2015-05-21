class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user, :title, :summary, :content

  scope :active, -> { where(active: true) }
  scope :from_user, ->(user) { joins(:user).where(user_id: user.id) }
end
