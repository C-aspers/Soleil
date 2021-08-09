class User < ApplicationRecord
validates :first_name,
  presence: true

validates :last_name,
  presence: true

validates :description,
  presence: true,
  length: { minimum: 5 }

validates :email, 
  presence: true

validates :encrypted_password, 
  presence: true



#Un utilisateur peut participer à plusieurs événements au travers des participations. 
has_many :events, through: :attendances
#Un utilisateur peut administrer plusieurs événements.
has_many :events
end
