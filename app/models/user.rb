class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_uniqueness_of :email

  before_create :set_default_role

  def admin?
    self.role.admin?
  end

  def editor?
    self.role.editor? || self.admin?
  end

  def role=(role)
    role = Role.find_by_name(role) unless role.is_a?(Role)
    super
  end

  private
  def set_default_role
    self.role ||= Role.find_by_name('visitor')
  end

end
