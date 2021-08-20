class Todo < ApplicationRecord
  belongs_to :user
  has_many :reminders
end
