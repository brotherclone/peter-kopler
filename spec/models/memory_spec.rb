require 'rails_helper'

RSpec.describe Memory, type: :model do

  describe 'Factory'do
    it{ expect(build(:memory)).to be_valid }
  end

  describe 'Factory with tags 'do
    it{ expect(build(:memory_with_tags)).to be_valid }
  end

  describe 'Factory with categories 'do
    it{ expect(build(:memory_with_categories)).to be_valid }
  end

  describe 'Factory with audio commentary 'do
    it{ expect(build(:memory_with_audio_commentary)).to be_valid }
  end

  describe 'Factory with video'do
    it{ expect(build(:memory_with_video)).to be_valid }
  end

  describe 'Must have an occurrence' do
    it { should validate_presence_of(:occurrence) }
  end

  it 'has one video' do
    should have_one(:video)
  end

  it 'has one audio commentaries' do
    should have_one(:audio_commentary)
  end

  it 'has many tags through tag memories' do
    should have_many(:tag_memories)
    should have_many(:tags).through(:tag_memories)
  end

  it 'has many categories through memory categories' do
    should have_many(:memory_categories)
    should have_many(:categories).through(:memory_categories)
  end

end