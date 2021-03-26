class Book < ApplicationRecord
  
  belongs_to :user
  attachment :image
  
  validates :name, presence: true
  validates :body, presence: true
end
