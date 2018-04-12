class SongsController < ApplicationController



  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    if !Artist.all.include?(params[:song][:artist])
      @artist = Artist.create(name: params[:song][:artist])
    end 
    binding.pry

  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

end
