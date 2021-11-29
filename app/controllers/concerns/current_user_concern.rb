module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user
    super || guest_user
  end

  def guest_user
    guest = GuestUser.new
    guest.name = 'Convidado'
    guest.first_name = 'Convidado'
    guest.last_name = 'Convidado'
    guest.email = 'convidado@email.com'
    guest
  end
end
