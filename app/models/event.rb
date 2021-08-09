class Event < ApplicationRecord
  #Validations : sa présence est obligatoire.
validates :start_date,
  presence: true

#et il est impossible de créer ou modifier un événement dans le passé.
validate :start_date_cannot_be_in_the_past

def start_date_cannot_be_in_the_past
  if start_date.present? && start_date < Date.today
    errors.add(:start_date, "can't be in the past")
  end
end

#Sa présence est obligatoire et est strictement positif
validates :duration, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
#et le nombre de minutes doit être un multiple de 5
validate :divisible_by_five
 
def divisible_by_five
  if (self.duration % 5) != 0
    self.errors[:base] << "Number must be divisible by 5!"
  end
end

validates :title,
  presence: true,
  length: { in: 5..140 }

validates :description,
  presence: true,
  length: { in: 20..1000 }

validates :price, 
  presence: true,
  inclusion: { in: 1..1000 }

validates :location, 
  presence: true


#Un utilisateur peut participer à plusieurs événements au travers des participations. 
has_many :users, through: :attendances
#Un utilisateur peut administrer plusieurs événements.
has_many :users
end
