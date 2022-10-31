class HeroesController < ApplicationController
    def index
        render json: Hero.all, status: :ok
    end
    def show
        hero = find_hero
        render json: hero, serializer: HeroShowSerializer, status: :ok
    end

    private

    def find_hero
        Hero.find(params[:id])
    end
end
