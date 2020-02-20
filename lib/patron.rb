class Patron
  attr_reader :name,
              :spending_money,
              :interests

  def initialize(name, spending_money)
    @name = name
    @spending_money = spending_money
    @interests = []
  end

  def add_interest(interest)
    @interests << interest
  end

  def interested_in?(exhibit)
    @interests.include?(exhibit.name)
  end
end
