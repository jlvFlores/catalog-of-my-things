require './genre'
require './music_album'
require 'date'

describe MusicAlbum do
  let(:genre) { Genre.new('Rock') }

  context 'when receiving valid parameters' do
    let(:music_album) { MusicAlbum.new(genre, '2012-07-10', true) }

    it 'returns a valid MusicAlbum object' do
      expect(music_album).to be_instance_of(MusicAlbum)
    end
  end

  context 'checking can_be_archived? method' do
    let(:today) { Date.today.to_s }

    it 'when date is LESS than 10 years and is NOT on spotify' do
      music_album = MusicAlbum.new(genre, today, false)
      music_album.move_to_archive
      expect(music_album.archived).to eq(false)
    end

    it 'when date is LESS than 10 years and is on spotify' do
      music_album = MusicAlbum.new(genre, today, true)
      music_album.move_to_archive
      expect(music_album.archived).to eq(false)
    end

    it 'when date is MORE than 10 years and is NOT on spotify' do
      music_album = MusicAlbum.new(genre, '2012-07-10', false)
      music_album.move_to_archive
      expect(music_album.archived).to eq(false)
    end

    it 'when date is MORE than 10 years and is on spotify' do
      music_album = MusicAlbum.new(genre, '2012-07-10', true)
      music_album.move_to_archive
      expect(music_album.archived).to eq(true)
    end
  end
end
