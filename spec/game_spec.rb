require './game'
require './author'
require 'date'

describe Game do
  let(:author) { Author.new('Hidetaka', 'Miyazaki') }
  let(:today) { Date.today.to_s }
  let(:multiplayer) { true }
  let(:over_decade) { Date.parse(today).prev_year(11).to_s }

  context 'when receiving valid parameters' do
    let(:game) { Game.new(author, today, multiplayer, over_decade) }

    it 'returns a valid Game object' do
      expect(game).to be_instance_of(Game)
    end
  end

  context 'checking can_be_archived? method' do
    it 'when publish_date is LESS than 10 years and last_played_at is LESS than 2 years' do
      game = Game.new(author, today, multiplayer, today)
      game.move_to_archive
      expect(game.archived).to eq(false)
    end

    it 'when publish_date is LESS than 10 years and last_played_at is MORE than 2 years' do
      game = Game.new(author, today, multiplayer, over_decade)
      game.move_to_archive
      expect(game.archived).to eq(false)
    end

    it 'when publish_date is MORE than 10 years last_played_at is LESS than 2 years' do
      game = Game.new(author, over_decade, multiplayer, today)
      game.move_to_archive
      expect(game.archived).to eq(false)
    end

    it 'when publish_date is MORE than 10 years last_played_at is MORE than 2 years' do
      game = Game.new(author, over_decade, multiplayer, over_decade)
      game.move_to_archive
      expect(game.archived).to eq(true)
    end
  end
end
