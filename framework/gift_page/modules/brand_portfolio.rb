module BrandPortfolio
  include PageObject

  elements(:brand_name, xpath: "//div[@class = '_2W7REi _3gVKoS']")
  elements(:switch_brands, xpath: "//ul[@class='slick-dots']/li")
  button(:current_slick_dot, xpath: "//ul[@class='slick-dots']/li[@class='slick-active']/button")

  def get_all_brands
    brands = []
    switch_brands_elements.each do |switcher|
      switcher.click
      brand_name_elements.each { |brand| brands << brand.text }
      brands
    end
    brands.uniq - ['']
  end

  def click_next_slick_dot
    next_dot_number = current_slick_dot_element.text.to_i + 1
    next_dot_xpath = "(//ul[@class='slick-dots']/li/button[contains(text(), '#{next_dot_number.to_s}')])[1]"
    @instance.driver.find_element(xpath: next_dot_xpath).click
  end

  def brand_xpath(brand)
    "//div[contains(text(), '#{brand}')]"
  end

  def hover_over_brand(brand)
    brand_element = @instance.driver.find_element(xpath: brand_xpath(brand))
    click_next_slick_dot unless brand_element.displayed?
    @instance.driver.action.move_to(brand_element).perform
  end

  def fragrance_element(brand, fragrance)
    fragrance_xpath = "#{brand_xpath(brand)}/../..//span[contains(text(), \"#{fragrance}\")]"
    @instance.driver.find_element(xpath: fragrance_xpath)
  end
end
