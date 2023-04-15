class Delivery < ApplicationRecord
  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :province

  with_options presence: true do
    validates :postcode, format: { with:  /\A\d{3}[-]\d{4}\z/, message: 'should be in the format of three digits, a hyphen, and four digits.' }
    validates :locality
    validates :block
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input 10-11 digits without any symbols.' }
  end

  validates :province_id, numericality: { other_than: 1 , message: "can't be blank"}
end
