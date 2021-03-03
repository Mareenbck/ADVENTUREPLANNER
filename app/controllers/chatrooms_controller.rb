class ChatroomsController < ApplicationController
  def index

    @bookings_upcomings = current_user.bookings.where('begin_date >= ?', Date.today)
    @bookings_passed = current_user.bookings.where('begin_date < ?', Date.today)

    @chatrooms_upcomings = @bookings_upcomings.map {|b| policy_scope(Chatroom).find(b.chatroom_id)}
    @chatrooms_passed = @bookings_passed.map {|b| policy_scope(Chatroom).find(b.chatroom_id)}

    # @next_chats = []
    # @chatrooms_upcomings.map { |c| 
    # if c.bookings.count > 1
    # @next_chats << c 
    # end }

    # @previous_chats = []
    # @chatrooms_passed.map { |c| 
    # if c.bookings.count > 1
    # @next_chats << c 
    # end }


  end
end

    # @chatrooms_upcomings = []
    # @chatrooms_passed= []
    # @bookings.each do |b|
    #   if b.begin_date >= Date.today
    #     @chatrooms_upcomings << Chatroom.find_by(booking_id: b.id)
    #   else
    #     @chatrooms_passed << Chatroom.find_by(booking_id: b.id)
    #   end
    # end
    # @chatrooms_upcomings = policy_scope(Chatroom).joins(:bookings).where('bookings.begin_date >= now()', user: current_user)
    # @chatrooms_passed = policy_scope(Chatroom).joins(:bookings).where('bookings.begin_date < now()', user: current_user )
    # @chatrooms = policy_scope(Chatroom)
    




# il faudra créer une policy pour la chatroom pour afficher l'index
# il faudra faire une requete active record qui join la table booking
# il faudra faire un check sur la date du booking
# booking.where(Date.today > end_date)
