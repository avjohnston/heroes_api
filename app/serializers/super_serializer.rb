class SuperSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :gender, :race, :intelligence, :strength, :speed, :full_name, :publisher
end
