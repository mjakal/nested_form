class Survey < ActiveRecord::Base
  has_many :questions, inverse_of: :survey, dependent: :destroy

  accepts_nested_attributes_for :questions, 
    allow_destroy: true, 
    reject_if: proc { |attributes| attributes['content'].blank? }

end