class HeroPowerSerializer < ActiveModel::Serializer
  belongs_to :hero, serializer: HeroShowSerializer
end
