class Category < ApplicationRecord
  has_many :tag_categories
  has_many :tags, :through => :tag_categories
  has_many :memory_categories
  has_many :memories, :through => :memory_categories
  validates :name, presence: true
  attr_accessor :display_state
  enum display_state: [:on, :off, :hinted]
end
