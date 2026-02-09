class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end
#sauvegarder un gossip
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [author, content]
    end
  end
#tout les gossips
  def self.all
    all_gossips = []
    CSV.foreach("./db/gossip.csv") do |row|
      all_gossips << Gossip.new(row[0], row[1])
    end
    all_gossips
  end
#chercher un gossip par son id
  def self.find(id)
    row = CSV.read("./db/gossip.csv")[id.to_i]
    Gossip.new(row[0], row[1])
  end
#modifier un gossip
  def self.update(id, author, content)
    gossips = CSV.read("./db/gossip.csv")
    gossips[id.to_i] = [author, content]
    CSV.open("./db/gossip.csv", "w") do |csv|
      gossips.each { |row| csv << row }
    end
  end
#supprimer un gossip
  def self.delete(id)
    gossips = CSV.read("./db/gossip.csv")
    gossips.delete_at(id.to_i)
    CSV.open("./db/gossip.csv", "w") do |csv|
      gossips.each { |row| csv << row }
    end
  end
end