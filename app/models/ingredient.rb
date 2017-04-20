class Ingredient < ApplicationRecord
  before_destroy :check
  has_many :doses, dependent: :destroy
  validates :name, presence: :true, uniqueness: true


  private
  def check
    return raise ActiveRecord::InvalidForeignKey unless self.doses.empty?
  end
end
