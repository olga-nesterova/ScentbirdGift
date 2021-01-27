require 'page-object'

class WhoIsThisGiftFor
  include PageObject

  text_field(:recipient_name, xpath: "//input[@id='giftModalRecipientName']")
  text_field(:recipient_name, xpath: "//input[@id='giftModalRecipientEmail']")
  text_area(:personal_message, xpath: "//input[@id='giftModalPersonalMessage']")

  def initialize(instance)
    super(instance.driver)
    @instance = instance
    self.wait_to_load
  end

  def wait_to_load
    @instance.wait_until { recipient_name_element.present? }
  end
end
