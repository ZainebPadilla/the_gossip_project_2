class GossipTag < ApplicationRecord
  belongs_to :gossip
  belongs_to :tag
end
#relation "many-to-many" entre Gossip et Tag :  Gossip peut avoir plusieurs Tags et Tag peut être sur plusieurs Gossips: créer table de jointure.