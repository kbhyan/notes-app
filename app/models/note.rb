class Note < ApplicationRecord
  # associations
  belongs_to :user

  # validations
  validates :title, presence: true, length: { minimum: 5 }
end
