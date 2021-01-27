# Create one structure for repetitive tests to reuse same logic

shared_examples_for 'gift_order' do |gift_time_list, for_whom|
  gift_time_list.each do |time|
    describe time do
      it "Gift order #{for_whom}: check price for `#{time.to_s}`" do
        expected_price = GiftData.commercial_workspace_list_type[time]
        expect(order_gift_page.gift_price(time)).to eq(expected_price)
      end

      it "Gift order #{for_whom}: 'Order now' button works for `#{time.to_s}`" do
        @who_is_this_gift_for_page = order_gift_page.order_gift(time)
        expect(@who_is_this_gift_for_page).to be_a WhoIsThisGiftFor
      end
    end
  end
end
