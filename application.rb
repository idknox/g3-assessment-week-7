require 'sinatra/base'
require_relative './lib/model/table'
require './lib/country_list'

class Application < Sinatra::Application

  def initialize
    super
    @db = Table.new
  end

  get '/' do
    erb :index, :locals => {:msg => @db.get_msg}
  end

  get '/continents' do
    all_continents = CountryList.new.continents
    erb :continents, locals: { continents: all_continents }
  end

  get '/continents/:continent_name' do
    list_of_countries = CountryList.new.countries_for_continent(params[:continent_name])
    erb :countries, locals: { countries: list_of_countries, continent: params[:continent_name] }
  end

  post "/" do
  @db.add_msg(params[:name], params[:msg])
    redirect "/"
  end

end