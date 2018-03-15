class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  serialize :lied_cats, Array
    def self.random_cat(ids) 
      Cat.where("id NOT IN (?)", ids).order("RANDOM()")
    end 
end
