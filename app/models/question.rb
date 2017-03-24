class Question < ActiveRecord::Base
  belongs_to :survey, inverse_of: :questions
  has_many :answers, inverse_of: :question, dependent: :destroy

  accepts_nested_attributes_for :answers, 
    allow_destroy: true,
    reject_if: proc { |attributes| attributes['content'].blank? }

end