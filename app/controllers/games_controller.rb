require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @rand_letters = (0...10).map { ('a'..'z').to_a[rand(26)] }
  end

  def score
    @rand = params[:rand_letters].split.join(', ')
    @user_word = params['word']
    url = "https://wagon-dictionary.herokuapp.com/#{@user_word}"
    word_serialized = URI.open(url).read
    @api_result = JSON.parse(word_serialized)
  end
end
