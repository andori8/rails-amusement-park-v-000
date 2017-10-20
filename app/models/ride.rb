class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if !height_req && !ticket_req
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif !height_req
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif !ticket_req
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    else
      update_user
      "Thanks for riding the #{self.attraction.name}!"
    end
  end

  def height_req
    self.user.height >= self.attraction.min_height
  end

  def ticket_req
    self.user.tickets >= self.attraction.tickets
  end

  def update_user
    self.user.tickets -= self.attraction.tickets
    self.user.nausea += self.attraction.nausea_rating
    self.user.happiness += self.attraction.happiness_rating
    self.user.save
  end
end
