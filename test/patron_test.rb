require 'minitest/autorun'
require 'pry'
require './lib/patron'
require './lib/exhibit'

class PatronTest < Minitest::Test
  def setup
    @patron_1 = Patron.new("Bob", 20)
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
  end
  def test_it_exists
    assert_instance_of Patron, @patron_1
  end

  def test_it_has_attributes
    assert_equal 'Bob', @patron_1.name
    assert_equal 20, @patron_1.spending_money
    assert_equal [], @patron_1.interests
  end

  def test_it_can_add_interests
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")

    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], @patron_1.interests
  end

  def test_it_is_interested_in_exhibit
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")

    assert_equal true, @patron_1.interested_in?(@dead_sea_scrolls)
    assert_equal false, @patron_1.interested_in?(@imax)
  end
end
