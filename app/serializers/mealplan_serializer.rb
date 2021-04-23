class MealplanSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id

  attributes :recipe_id
end
