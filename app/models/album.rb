class Album < ActiveRecord::Base
  validates :title, :genre, :artist, presence: true
  validates :title, uniqueness: { scope: :artist }

end
