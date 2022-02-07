require 'gossip'

class ApplicationController < Sinatra::Base
  #Relier la page index.erb
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  #Relier la page new_gossip.erb
  get '/gossips/new/' do
    erb :new_gossip
  end

  #Méthode pour URL dynamique non finie
  get '/gossips/id' do
    erb :show, locals: {gossips: Gossip.find(params["id"])}
  end

  # =gets.chomp / "envoyer le contenu d'un formulaire et obtenir une réponse en retour."
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save  
    redirect '/'
  end
end