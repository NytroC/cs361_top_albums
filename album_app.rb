require 'erb'
require 'sinatra'
require_relative 'sort_album_list'

class AlbumApp < Sinatra::Base
  def initialize
    @stored_sorting_state = ''
    @album_list = sort_albums('rank')
  end
  # albums.sort_by {|_key, value| _key}.to_h

  get '/' do

    erb :index
  end

  def sort_by

  end





end
