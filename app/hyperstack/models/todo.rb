class Todo < ApplicationRecord
  scope :completed, -> { where(completed: true) }
  scope :active, -> { where(completed: false) }

  def self.all_completed?
    active.none?
  end
end
