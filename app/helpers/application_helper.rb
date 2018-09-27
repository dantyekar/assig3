module ApplicationHelper

  def full_title(page_title = '')
    base_title = 'Assignment 2'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def items_in_cart
    if session[:cart_id.present?]
      session[:cart_id].order_items.to_a.sum { |item| item.quantity }
    end
  end

  def this_food_in_cart(food)
    food_count = 0
    if !session.present? && !session[:cart].present?
      food_count = session[:cart][food.id.to_s].nil? ? 0 : session[:cart][food.id.to_s]
    end
  end

  def cart_properties
    cart_properties = {}
    if !session[:cart].present? || session[:cart].empty?
      cart_properties['items_count'] = 0;
      cart_properties['status'] = 'empty';
    else
      cart_properties['items_count'] = items_in_cart;
      cart_properties['status'] = 'not-empty';
    end
    cart_properties
  end

  def options_for_status
    ['Completed', 'Cancelled', 'Pending', 'Delivered']
  end
end
