class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    return true unless self.role != 'admin'
  end

  def employee?
    return true unless self.role != 'employee'
  end

  def guest?
    return true unless self.role != 'guest'
  end
end
