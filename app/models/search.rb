class Search < ApplicationRecord
  validates :name, uniqueness: {scope: [:full_name,
                                        :gender,  
                                        :min_intelligence, 
                                        :max_intelligence, 
                                        :min_speed, 
                                        :max_speed,
                                        :min_strength, 
                                        :max_strength, 
                                        :publisher, 
                                        :race]}

end