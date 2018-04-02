class Recipe < ApplicationRecord
    before_validation :generate_slug

  CATEGORIES = [
    "Coatings",
    "Gasses",
    "Inert",
    "Inks",
    "Liniments",
    "Particulates",
    "Sprays",
    "Tonics",
    "Vials"
  ]
  SUBTYPES ={
    "Coatings"=>[
      {1=>"Dust"},
      {2=>"Powder"},
      {3=>"Pulverant"}
    ],
    "Gasses" =>[
      {1=>"Gas"}
    ],
    "Inert"=>[
      {1=>"Inert"}
    ],
    "Inks"=>[
      {1=>"Ink"}
    ],
    "Liniments"=>[
      {1=>"Ointment"},
      {2=>"Salve"},
      {3=>"Balm"}
    ],
    "Particulates"=>[
      {1=>"Oil"},
      {2=>"Grease"},
      {3=>"Unguent"}
    ],
    "Sprays" =>[
      {1 =>"Spray"}
    ],
    "Tonics"=>[
      {1=>"Tincture"},
      {2=>"Potion"},
      {3=>"Elixir"}
    ],
    "Vials"=>[
      {2=>"Vial"}
    ]
  }


  EFFECT_FAMILY = [
    "Advantage",
    "Bestow Defensive",
    "Bestow Skill",
    "Component",
    "Curing",
    "Damage",
    "Damage Reduction",
    "Disadvantage",
    "Healing",
    "RP",
    "Status Effect",
    "Utility"
  ]



  has_many :recipe_books
  has_many :character_recipes
  has_many :characters, through: :character_recipes
  belongs_to :extraction_ingredient, class_name: 'Ingredient', foreign_key: :extraction_ingredient_id, optional: true
  belongs_to :concentration_ingredient, class_name: 'Ingredient', foreign_key: :concentration_ingredient_id, optional: true
  belongs_to :dissolution_ingredient, class_name: 'Ingredient', foreign_key: :dissolution_ingredient_id, optional: true
  belongs_to :calcination_ingredient, class_name: 'Ingredient', foreign_key: :calcination_ingredient_id, optional: true

  validates_presence_of :name, :slug

  def self.categories
    Recipe::CATEGORIES
  end

  def self.effect_families
    Recipe::EFFECT_FAMILY
  end

  def self.subtypes
    Recipe::SUBTYPES
  end

  def self.determine_level(recipe)
    level = 0
    if recipe.extraction_ingredient_id?
      level +=1
    end
    if recipe.dissolution_ingredient_id?
      level +=1
    end
    if recipe.concentration_ingredient_id?
      level +=1
    end
    if recipe.calcination_ingredient_id?
      level +=1
      if level > 3
        level = 3
      end
    end
    if recipe.category =="Inert" || recipe.category =="Vials" || recipe.category =="Inks" || recipe.category =="Gasses"
      level = 1
    end
    subtype = Recipe.subtypes[recipe.category][level-1].values[0]
    delivery = "None"
    if recipe.category == "Coatings" || recipe.category == "Liniments" || recipe.category == "Particulates"
      delivery = "Applied"
    elsif recipe.category == "Gasses"
      delivery = "Packet"
    elsif recipe.category == "Tonics"
      delivery = "Ingested"
    else
      delivery = "None"
    end
    return {"Delivery" => delivery, "Subtype" => subtype, "Level" => level}
  end

  def to_param
    slug
  end

  protected
  
  def generate_slug
    self.slug ||= name.parameterize
  end
end
