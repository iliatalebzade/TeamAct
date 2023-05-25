class Category < ApplicationRecord
  belongs_to :parent_category, class_name: 'Category', optional: true
  has_many :sub_categories, class_name: 'Category', foreign_key: :parent_category_id, optional: true
  has_many :teams
end
