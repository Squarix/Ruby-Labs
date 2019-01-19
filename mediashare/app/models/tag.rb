# frozen_string_literal: true
require 'elasticsearch/model'

class Tag < ApplicationRecord
  has_many :taggings
  has_many :posts, through: :taggings

  def self.counts
    select('name, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tad_id')
  end

  include Tire::Model::Search
  include Tire::Model::Callbacks
  include Elasticsearch::Model
end
