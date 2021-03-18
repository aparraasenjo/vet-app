class Pet < ApplicationRecord
    has_many :pethistories, dependent: :destroy
    belongs_to :client
    def to_s
        name
    end
    def history_count
            self.pethistories.count
    end
        
    def avg_weight
            self.pethistories.sum(:weight) / self.pethistories.count
    end
        
    def avg_height
        self.pethistories.sum(:height) / self.pethistories.count
    end
        
    def max_weight
        self.pethistories.maximum(:weight)
    end
        
    def max_height
        self.pethistories.maximum(:height)
    end
end
