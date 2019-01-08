# frozen_string_literal: true

class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :taggings
  belongs_to :user
  has_many :tags, through: :taggings
  belongs_to :category

  validates :title, :image, :user_id, presence: true

  def all_tags
    tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
end
