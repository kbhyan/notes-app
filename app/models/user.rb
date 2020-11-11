class User < ApplicationRecord
  has_secure_password

  # associations
  has_many :notes, dependent: :destroy

  EMAIL_REGEX = /(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})/i

  # validations
  validates_presence_of :name, :email
  validates :name, length: { minimum: 2 }
  validates :email, uniqueness: true,
                    format: { with: EMAIL_REGEX, message: 'Please enter a valid Email' } 
end
