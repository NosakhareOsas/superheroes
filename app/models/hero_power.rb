class HeroPower < ApplicationRecord
  belongs_to :hero
  belongs_to :power

  validates :strength, inclusion: {in: %w(Strong Average Weak), message: "has the wrong value, try Strong, Average or Weak" }
end
