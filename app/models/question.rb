class Question < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  acts_as_votable
end
