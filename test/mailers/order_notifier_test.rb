require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Corsicheese Store Order Confirmation", mail.subject
    assert_equal ["gael@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /1 x Plateau A/, mail.body.encoded
  end
  
  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Corsicheese Store Order Shipped", mail.subject
    assert_equal ["gael@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>Plateau A<\/td>/, mail.body.encoded
  end      
end
