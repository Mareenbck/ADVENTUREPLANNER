class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom).joins(:bookings).where('bookings.begin_date >= ?', Date.today )
  end

end

# il faudra créer une policy pour la chatroom pour afficher l'index
# il faudra faire une requete active record qui join la table booking
# il faudra faire un check sur la date du booking
# booking.where(Date.today > end_date)
