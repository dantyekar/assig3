class CurrentOrder
  attr_accessor :total
  attr_accessor :sub_total
  attr_accessor :ordered_items

  def initialize(current_order)
    @ordered_items = current_order['items'] || {}
    current_order['details'] ||= {}
    @total = current_order['details']['total'].to_i || 0
    @sub_total = current_order['details']['sub_total'].to_i || 0
    @user = {}
    @invoice = ''
    @transaction_id = ''
    @status = 'pending'
  end

  def update_order(order, args)
    @ordered_items = order['items'] || {}
    @total = order['details']['total'] || 0
    @invoice = args[:invoice] || ''
    @transaction_id = args[:txn_id] || ''
    @status = args[:status] || 'pending'
  end

  def save_order(current_user)
    user = current_user
    new_order = user.orders.new(total: @total,
                                invoice: @invoice,
                                transaction_id: @transaction_id)
    new_order.save
    if new_order.save
      @ordered_items.each do |index, details|
        new_order.order_items <<
          OrderItem.create(food_id: details['food']['id'],
                           quantity: details['qty'])
      end
    end
    new_order.save
  end

  def delete
  end

end
