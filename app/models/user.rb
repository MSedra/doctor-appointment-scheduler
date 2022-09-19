class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, format: { with: Devise.email_regexp }      
  validates_presence_of :name, :title, :gender #take care that gender's default is 0 (male)      
end
