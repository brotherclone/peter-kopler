class Tag < ApplicationRecord
  has_many :tag_memories
  has_many :memories, :through => :tag_memories
  has_many :tag_categories
  has_many :categories, :through => :tag_categories
  validates :name, presence: true
  enum display_state: [:on, :hinted, :selected]
  attr_accessor :display_state
end
