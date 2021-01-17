class Image < ApplicationRecord
  has_one_attached :image
  validates_uniqueness_of :title
  has_and_belongs_to_many :tags
  belongs_to :user
end
