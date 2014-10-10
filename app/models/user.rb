class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  validates :name, presence: true

     
  has_many :places, foreign_key: :owner_id
  has_many :reservations

  has_many :reviews
end
