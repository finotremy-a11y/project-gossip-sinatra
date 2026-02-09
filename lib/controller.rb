require 'bundler'
Bundler.require
require 'sinatra/base'
require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    p Gossip.all
    @gossips = Gossip.all
    erb :index
  end
  
  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id' do
    @gossip = Gossip.find(params['id'])
    @id = params['id']
    erb :show
  end

  get '/gossips/:id/edit' do
    @id = params['id']
    @gossip = Gossip.find(@id)
    erb :edit
  end

  post '/gossips/:id/edit' do
    Gossip.update(params['id'], params['gossip_author'], params['gossip_content'])
    redirect '/'
  end

  post '/gossips/:id/delete' do
    Gossip.delete(params['id'])
    redirect '/'
  end
end