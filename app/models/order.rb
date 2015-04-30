class Order < ActiveRecord::Base
  has_and_belongs_to_many :items
  belongs_to :user
  accepts_nested_attributes_for :items

  def total_price
    full_price = 0
      if self.items
        self.items.each do |item|
          full_price += item.price
        end
      end

    return full_price
  end
end
