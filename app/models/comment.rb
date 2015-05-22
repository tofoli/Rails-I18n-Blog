class Comment < ActiveRecord::Base
  belongs_to :post

  validates_presence_of :email, :comment, :post
  validates_length_of :email, maximum: 255
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_length_of :comment, in: 5..500
end
