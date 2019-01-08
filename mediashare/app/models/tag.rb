# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :taggings
  has_many :posts, through: :taggings

  def self.counts
    select('name, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tad_id')
  end
end
