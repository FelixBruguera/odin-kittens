class Kitten < ApplicationRecord
    validates :cuteness, inclusion:  { in:1..10 }
    validates :softness, inclusion:  { in:1..10 }
end

