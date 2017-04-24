class Message < ApplicationRecord
  validates :content, presence:true,
    length: {minimum:3, maximum:100}
    belongs_to :user
    belongs_to :order, optional:true
    belongs_to :product
end
