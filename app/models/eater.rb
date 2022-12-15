class Eater < ApplicationRecord
  belongs_to :member
  belongs_to :meal
end
