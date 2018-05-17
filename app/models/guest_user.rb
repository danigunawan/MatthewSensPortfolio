class GuestUser < User
  # attr_accessor provides getters and setters; provides ability for this class to have data passed to it
  attr_accessor :name, :first_name, :last_name, :id
end
