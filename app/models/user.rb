class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, ::registerable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :registerable, :validatable 
  has_many :videos
end
