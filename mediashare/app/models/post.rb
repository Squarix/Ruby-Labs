# frozen_string_literal: true
require 'elasticsearch/model'

class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :taggings
  has_many :comments, :as => :commentable
  belongs_to :user
  has_many :tags, through: :taggings
  belongs_to :category

  validates :title, :image, :user_id, presence: true

  include Tire::Model::Search
  include Tire::Model::Callbacks
  include Elasticsearch::Model

  mapping do
    indexes :id, type: 'integer'
    indexes :user_id, type: 'integer'
    indexes :user_name
    indexes :category_id, type: 'integer'
    indexes :category_name
    indexes :title, boost: 10
    indexes :description
    indexes :created_at, type: 'integer'
  end

  def all_tags
    tags.map(&:name).join(' ')
  end

  def all_tags=(names)
    self.tags = names.split(%r{#* }).map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def self.do_search(params)
    tire.search(load: true, page: params[:page], per_page: 4) do
      query do
        boolean do
          must { string params[:query], default_operator: 'AND' } if params[:query].present?
          must { range :created_at, lte: Time.zone.now }
          must { term :category_id, params[:category_id] } if params[:category_id].present?
        end
      end
      sort { by :created_at, 'desc' } if params[:query].blank?
      facet 'categories' do
        terms :category_id
      end
    end
  end

  def to_indexed_json
    to_json(methods: [:category_name])
  end

  def category_name
    category.name
  end

  def user_name
    user.email
  end
end