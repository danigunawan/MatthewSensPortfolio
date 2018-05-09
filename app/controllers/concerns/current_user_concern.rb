module CurrentUserConcern
  extend ActiveSupport::Concern

  # this OVERRIDES the Devise current_user method
  def current_user
    # super here takes current_user from the Devise current_user method
    # below means if super is true ie there is a current_user, OR guest_user is true
    super || guest_user
  end

  def guest_user
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guest@example.com"
    guest
  end
  
  # OpenStruct.new(name: "Guest User",
  #               first_name: "Guest",
  #               last_name: "User",
  #               email: "guest@gmail.com")

end
