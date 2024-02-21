class Entry < ApplicationRecord
  # talks to the "posts" table
  belongs_to :place

  # Define date attribute
  attribute :date, :date
end
