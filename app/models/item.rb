class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :province
  belongs_to :shipping_day
  
  validates :item_name, :description, :price, presence: true


  with_options numericality: { other_than: 1, message: "can't be blank"} do
    validates :category
    validates :condition
    validates :postage
    validates :province
    validates :shipping_day
  end


end
