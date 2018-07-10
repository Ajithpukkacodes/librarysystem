class Book < ApplicationRecord
  belongs_to :user, optional: true
  validates :title,
            :presence => true
  validates :s_no,
            :presence => true,
            :uniqueness => true
  validates :description,
            :presence => true
end
