class Task < ApplicationRecord
    validates :content, presence: true, length: { maximum: 15 }
    validates :date, presence: true, length: { maximum: 15 }
    
    belongs_to :user
end
