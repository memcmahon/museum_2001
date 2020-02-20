class Museum
  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def admit(patron)
    @patrons << patron
  end

  def recommend_exhibits(patron)
    @exhibits.find_all do |exhibit|
      patron.interested_in?(exhibit)
    end
  end

  def patrons_by_exhibit_interest
    # exhibit_patrons = {}
    # @exhibits.each do |exhibit|
    #   exhibit_patrons[exhibit] = @patrons.find_all do |patron|
    #     patron.interests.include?(exhibit.name)
    #   end
    # end
    # exhibit_patrons

    @exhibits.reduce({}) do |exhibit_patrons, exhibit|
      exhibit_patrons[exhibit] = @patrons.find_all do |patron|
        patron.interested_in?(exhibit)
      end
      exhibit_patrons
    end
  end

  def ticket_lottery_contestants(exhibit)
    @patrons.find_all do |patron|
      patron.interested_in?(exhibit) && patron.spending_money < exhibit.cost
    end
  end

  def draw_lottery_winner(exhibit)
    if ticket_lottery_contestants(exhibit).empty?
      nil
    else
      ticket_lottery_contestants(exhibit).sample.name
    end
  end

  def announce_lottery_winner(exhibit)
    winner = draw_lottery_winner(exhibit)
    if winner.nil?
      "No winners for this lottery"
    else
      "#{winner} has won the #{exhibit.name} exhibit lottery"
    end
  end
end
