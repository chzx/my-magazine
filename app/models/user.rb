class User < ActiveRecord::Base
  validates_uniqueness_of :email, :case_sensitive => false
  validates_presence_of :password, :on => :create, :message => "PW can't be blank!"
  validates_presence_of :email, :on => :create, :message => "email can't be blank!"

  has_many :articles

end
