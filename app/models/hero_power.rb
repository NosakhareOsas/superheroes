class HeroPower < ApplicationRecord
  belongs_to :hero
  belongs_to :power

  validates :strength, inclusion: {in: %w(Strong Average Weak), message: "is not included in the list, try Strong, Average or Weak" }
end
