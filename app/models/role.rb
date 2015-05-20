class Role < ActiveRecord::Base
  has_many :users

  def admin?
    self.name == 'admin'
  end

  def editor?
    self.name == 'editor'
  end
end
