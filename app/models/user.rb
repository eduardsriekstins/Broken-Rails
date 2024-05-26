class User < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_format_of :email, :with => /@*/, multiline: true
  validates :password, presence: true, confirmation: true, length: {within: 6..40}
end
