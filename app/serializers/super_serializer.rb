class SuperSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :intelligence, :strength, :speed, :gender, :race, :height, :weight, :first_appearance, :full_name, :publisher, :image
end
