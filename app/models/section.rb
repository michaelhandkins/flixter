class Section < ApplicationRecord
  belongs_to :course

  validates :title, presence: true
end
