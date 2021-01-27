require 'spec_helper'

RSpec.describe 'Order Gift' do
  before { @gift_page, @test = TestInstance.new.start_gift_page }

  describe 'for her' do
    before { @order_gift_for_her = @gift_page.click_buy_for_her }

    it_behaves_like 'gift_order', GiftData.commercial_workspace_list_type.keys, 'for her' do
      let(:order_gift_page) { @order_gift_for_her }
    end
  end

  describe 'for him' do
    before { @order_gift_for_him = @gift_page.click_buy_for_him }

    it_behaves_like 'gift_order', GiftData.commercial_workspace_list_type.keys, 'for him' do
      let(:order_gift_page) { @order_gift_for_him }
    end
  end

  after { @test.quit }
end
