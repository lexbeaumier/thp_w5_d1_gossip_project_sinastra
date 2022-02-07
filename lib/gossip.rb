class Gossip
  attr_accessor :author, :content

  #Ajouter une ligne "mon auteur, ma description" / lier a la base de donnée...
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  #Enregistre en CSV mais avec des paramètres dynamiques
  def initialize(gossip_author, gossip_content)
    @author = gossip_author
    @content = gossip_content
  end

  #Afficher l'index des gossips
  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  #Route dynamique (non fini)
  def self.find(id)
    selected_gossip = Gossip.all[id.to_i]
    return selected_gossip
  end
end



