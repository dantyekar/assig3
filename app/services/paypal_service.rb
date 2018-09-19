class PaypalService

  def self.paypal_url(current_user, return_url, ordered_items)
    @user = current_user
    @ordered_items = ordered_items
    values = {
      business: 'bob@bob.co',
      cmd: '_cart',
      upload: 1,
      rm: 2,
      return: return_url,
      notify_url: @user.email
    }
    counter = 1
    @ordered_items.each do |index, details|
      values.merge!({
        "amount_#{counter}" => details['food']['price'],
        "item_name_#{counter}" => details['food']['name'],
        "item_number_#{counter}" => counter,
        "quantity_#{counter}" => details['qty']
      })
      counter += 1
    end
    'https://www.sandbox.paypal.com/cgi-bin/webscr?' + values.to_query
  end

end