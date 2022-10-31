class HeroPowersController < ApplicationController
    
    def create
        hero_power = HeroPower.create!(post_params)
        hero = Hero.find(hero_power[:hero_id])  ###or use hero_power.hero
        render json: hero, serializer: HeroShowSerializer, status: :created  #include '**' multiple levels  serializer: HeroShowSerializer
    end

    private

    def post_params
        params.permit(:strength, :hero_id, :power_id)
    end
end
