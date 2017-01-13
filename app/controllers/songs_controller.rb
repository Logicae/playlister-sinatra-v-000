class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :"/songs/index"
  end

  get '/songs/new' do
    erb :"songs/new"
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    if !Artist.find_by_name(params["Artist Name"])
      @song.artist = Artist.create(name: params["Artist Name"])
    else
      artist = Artist.find_by_name(params["Artist Name"])
      @song.artist = artist
    end

    @song.genres << Genre.find_by_id(params["genres"])

    @song.save

    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  post '/songs/:slug' do

  end

end
