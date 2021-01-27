require 'page-object'
require_relative '../shared_example/gift_oder'
require_relative 'who_is_this_gift_for'


class GiftSize
  include PageObject

  button(:order_three_month, xpath: "//button[@id='giftSize0Button']")
  div(:three_month_price, xpath: "//div[@id='giftSize0ButtonDescription']/div[@class='_2KFktM']")

  button(:order_six_month, xpath: "//button[@id='giftSize1Button']")
  div(:six_month_price, xpath: "//div[@id='giftSize1ButtonDescription']/div[@class='_2KFktM']")

  button(:order_year, xpath: "//button[@id='giftSize2Button']")
  div(:year_price, xpath: "//div[@id='giftSize2ButtonDescription']/div[@class='_2KFktM']")


  def initialize(instance)
    super(instance.driver)
    @instance = instance
    self.wait_to_load
  end

  def wait_to_load
    @instance.wait_until { order_year_element.present? }
  end

  def order_gift(time)
    case time
    when :three_month
      order_three_month_element.click
    when :six_month
      order_six_month_element.click
    when :year
      order_year_element.click
    end
    WhoIsThisGiftFor.new(@instance)
  end

  def gift_price(time)
    case time
    when :three_month
      three_month_price_element.text
    when :six_month
      six_month_price_element.text
    when :year
      year_price_element.text
    end
  end
end
