class UserMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
    #permet de définir tout un ensemble de valeurs par défaut
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end
end
#l'objectif est que nos e-mails affichent toujours une adresse d’e-mail d'envoi : soit celle définie par la méthode du mailer, soit, à défaut, no-reply@monsite.fr.