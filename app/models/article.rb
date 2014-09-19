class Article < ActiveRecord::Base


  validates_presence_of :title
  validates_presence_of :author
  #validates_presence_of :content
  validates_presence_of :category

  validates :content, presence: true, length: {minimum: 141, maximum: 50000}

end
