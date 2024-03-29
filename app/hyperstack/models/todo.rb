class Todo < ApplicationRecord
  default_scope { order('completed asc, created_at desc') }

  scope :completed, -> { where(completed: true) }
  scope :active, -> { where(completed: false) }

  def self.all_completed?
    active.none?
  end
end
