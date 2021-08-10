class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :welcome_send
  #envoi d'un mail de bienvenue après création

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

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
