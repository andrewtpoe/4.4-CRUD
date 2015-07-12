require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  class Title < AlbumTest

    test "can not be blank" do
      a = Album.new(title: '', genre: 'test_genre', artist: 'test_artist')
      refute a.valid?
      assert a.errors.keys.include?(:title)
    end

    test "can not have length of zero" do
      a = Album.new(title: '', genre: 'test_genre', artist: 'test_artist')
      refute a.valid?
      assert a.errors.keys.include?(:title)
    end

  end

  class Artist < AlbumTest

    test "can not be blank" do
      a = Album.new(title: 'test_title', genre: 'test_genre', artist: '')
      refute a.valid?
      assert a.errors.keys.include?(:artist)
    end

    test "can not have length of zero" do
      a = Album.new(title: 'test_title', genre: 'test_genre', artist: '')
      refute a.valid?
      assert a.errors.keys.include?(:artist)
    end

  end

  class Genre < AlbumTest

    test "can not be blank" do
      a = Album.new(title: 'test_title', genre: '', artist: 'test_artist')
      refute a.valid?
      assert a.errors.keys.include?(:genre)
    end

    test "Genre can not have length of zero" do
      a = Album.new(title: 'test_title', genre: '', artist: 'test_artist')
      refute a.valid?
      assert a.errors.keys.include?(:genre)
    end

  end

  class Operation < AlbumTest

    test "Ideal conditions work as expected" do
      a = Album.new(title: 'test_title', genre: 'test_genre', artist: 'test_artist')
      assert a.valid?
    end

    test "Valid record can be saved and retrieved" do
      Album.create!(title: 'test_title', genre: 'test_genre', artist: 'test_artist')
      record = Album.find_by(title: 'test_title')
      assert record.present?
    end

    test "Artist & Song can not be duplicated" do
      Album.create!(title: 'test_title', genre: 'test_genre', artist: 'test_artist')
      b = Album.new(title: 'test_title', genre: 'test_genre2', artist: 'test_artist')
      refute b.valid?
    end

    test "Artist can have multiple songs" do
      Album.create!(title: 'test_title', genre: 'test_genre', artist: 'test_artist')
      b = Album.new(title: 'second_test_title', genre: 'test_genre2', artist: 'test_artist')
      assert b.valid?
    end

    test "Multiple artists can have same song title" do
      Album.create!(title: 'test_title', genre: 'test_genre', artist: 'test_artist')
      b = Album.new(title: 'test_title', genre: 'test_genre', artist: 'second_test_artist')
      assert b.valid?
    end

  end

end
