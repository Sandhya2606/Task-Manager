class Task < ApplicationRecord
  belongs_to :user # This creates the association with the User model

  before_validation :set_default_status

  private

  def set_default_status
    self.status ||= "Not Started"
  end
end
