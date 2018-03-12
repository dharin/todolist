class Item < ApplicationRecord
  belongs_to :list
  scope :undone_items, -> { where(state: 0) }
  scope :done_items, -> { where(state: 1) }
end
