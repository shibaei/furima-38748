class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :province, :locality, :block, :apartment, :telephone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with:  /\A\d{3}[-]\d{4}\z/, message: 'should be in the format of three digits, a hyphen, and four digits.' }
    validates :locality
    validates :block
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input 10-11 digits without any symbols.' }
  end

  validates :province, numericality: { other_than: 1 , message: "can't be blank"}

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Delivery.create( postcode: postcode, province_id: province, locality: locality, block: block, apartment: apartment, telephone_number: telephone_number,purchase_id: purchase.id)
  end

end