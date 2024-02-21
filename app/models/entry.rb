class Entry < ApplicationRecord
  # talks to the "posts" table
  belongs_to :place

  # Define date attribute
  attribute :posted_on, :date
end
