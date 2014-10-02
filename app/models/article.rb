class Article < ActiveRecord::Base


  validates_presence_of :title
  #validates_presence_of :content
  validates_presence_of :category

  validates :content, presence: true, length: {minimum: 1, maximum: 50000}

  belongs_to :user

  def author
    "the author name!"
  end

end
