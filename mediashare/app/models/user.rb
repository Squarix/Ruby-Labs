# frozen_string_literal: true
require 'elasticsearch/model'


class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :comment, dependent: :destroy

  include Tire::Model::Search
  include Tire::Model::Callbacks
  include Elasticsearch::Model

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
