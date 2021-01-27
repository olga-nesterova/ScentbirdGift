require 'page-object'
require_relative 'gift_size'
require_relative '../data/gift_data'
require_relative 'modules/brand_portfolio'

class GiftPage
  include PageObject
  include BrandPortfolio

  button(:buy_gift_now_top, xpath: "//button[@id='buyGiftNow']")
  button(:buy_gift_now_bottom, xpath: "//div[@class='_1tNN5y']/button[@class='Qu4--5 button on-w4v _2EvxiA _2wMMdy _1xUtQE']")

  button(:buy_for_her, xpath: "//button[@id='buyForHer']")
  button(:buy_for_him, xpath: "//button[@id='buyForHim']")

  def initialize(instance)
    super(instance.driver)
    @instance = instance
    self.wait_to_load
  end

  def wait_to_load
    @instance.wait_until { buy_gift_now_top_element.present? }
  end

  def click_buy_for_her
    buy_for_her_element.click
    GiftSize.new(@instance)
  end

  def click_buy_for_him
    buy_for_him_element.click
    GiftSize.new(@instance)
  end

  def is_visible_in_viewport(elem)
    execute_script(<<-JS, elem)
    let box = arguments[0].getBoundingClientRect();
    return box.top < window.innerHeight && box.bottom >= 0;
    JS
  end

  def scroll_time
    sleep 1
  end

  def scroll_to_bottom_buy_gift_button
    buy_gift_now_bottom_element.scroll_into_view
  end
end
