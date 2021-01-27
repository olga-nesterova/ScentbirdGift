require_relative 'gift_page/gift_page'
class TestInstance
  attr_accessor :test
  def initialize
    super
    @test = Watir::Browser.new :chrome
    @test.goto 'https://www.scentbird.com/gift'
  end

  def start_gift_page
    gift_page = GiftPage.new(@test)
    [gift_page, @test]
  end
end
