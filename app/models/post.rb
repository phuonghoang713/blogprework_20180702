class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  def self.search(term)
    where("title || body ILIKE ?","%#{term}%")    
  end
end
