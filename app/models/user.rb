class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name

# below we use split.first and split.last so that if a user only enters a first
# name the method still works. if we tried to use [0] and [1] we would get an error
  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end
end
