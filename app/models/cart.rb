class Cart < ActiveRecord::Base
  has_many :orders
  has_many :products, through: :orders

  def total_price
    orders.map {|order| order.quantity * order.product.price}.sum
  end
end
