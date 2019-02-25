class List < ApplicationRecord
  has_many :artists, dependent: :destroy
end
