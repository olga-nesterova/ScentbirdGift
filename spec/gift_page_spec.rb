require 'spec_helper'

RSpec.describe 'GiftPage' do
  before { @gift_page, @test = TestInstance.new.start_gift_page }

  it 'Check Top `Buy gift now` button' do
    @gift_page.buy_gift_now_top
    @gift_page.scroll_time
    expect(@gift_page.is_visible_in_viewport(@gift_page.buy_for_him_element)).to be_truthy
  end

  it 'Check work`Buy the gift for him` button' do
    @order_gift_for_him = @gift_page.click_buy_for_him
    expect(@order_gift_for_him).to be_a GiftSize
  end

  it 'Check work`Buy the gift for her` button' do
    @order_gift_for_him = @gift_page.click_buy_for_her
    expect(@order_gift_for_him).to be_a GiftSize
  end

  it "Check brand list" do
    expect(@gift_page.get_all_brands).to eq(GiftData.brands_info.keys)
  end

  GiftData.brands_info.each do |brand, fragrances|
    it "#{brand} has correct fragrances" do
      @gift_page.hover_over_brand(brand)
      fragrances.each do |fragrance|
        expect(@gift_page.fragrance_element(brand, fragrance)).to be_displayed
      end
    end
  end

  it 'Check Bottom `Buy gift now` button' do
    sleep 7 # wait until data storage policy popup will be closed
    @gift_page.buy_gift_now_bottom
    @gift_page.scroll_time
    expect(@gift_page.is_visible_in_viewport(@gift_page.buy_for_him_element)).to be_truthy
  end

  after { @test.quit }
end
