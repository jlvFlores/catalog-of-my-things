require './genre'
require './music_album'
require 'date'

describe MusicAlbum do
  let(:genre) { Genre.new('Rock') }
  let(:today) { Date.today.to_s }
  let(:over_decade) { Date.parse(today).prev_year(11).to_s }
  let(:on_spotify_true) { true }
  let(:on_spotify_false) { false }

  context 'when receiving valid parameters' do
    let(:music_album) { MusicAlbum.new(genre, today, on_spotify_true) }

    it 'returns a valid MusicAlbum object' do
      expect(music_album).to be_instance_of(MusicAlbum)
    end
  end

  context 'checking can_be_archived? method' do
    it 'when date is LESS than 10 years and is NOT on spotify' do
      music_album = MusicAlbum.new(genre, today, on_spotify_false)
      music_album.move_to_archive
      expect(music_album.archived).to eq(false)
    end

    it 'when date is LESS than 10 years and is on spotify' do
      music_album = MusicAlbum.new(genre, today, on_spotify_true)
      music_album.move_to_archive
      expect(music_album.archived).to eq(false)
    end

    it 'when date is MORE than 10 years and is NOT on spotify' do
      music_album = MusicAlbum.new(genre, over_decade, on_spotify_false)
      music_album.move_to_archive
      expect(music_album.archived).to eq(false)
    end

    it 'when date is MORE than 10 years and is on spotify' do
      music_album = MusicAlbum.new(genre, over_decade, on_spotify_true)
      music_album.move_to_archive
      expect(music_album.archived).to eq(true)
    end
  end

  context 'checking to_hash method' do
    let(:music_album) { MusicAlbum.new(genre, today, on_spotify_true) }

    it "returns a hash of the class's data" do
      expected_return = { publish_date: Date.parse(today), genre: genre.to_hash, on_spotify: on_spotify_true }
      expect(music_album.to_hash).to eq(expected_return)
    end
  end
end
