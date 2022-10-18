class HeroesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
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

    def render_record_not_found
        render json: {error: "Hero not found"}, status: :not_found
    end
end
