class M::Job < ApplicationRecord
  include M
  has_many :users, dependent: :nullify
end
