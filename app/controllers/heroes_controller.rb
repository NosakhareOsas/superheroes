class HeroesController < ApplicationController
    def index
        render json: Hero.all, status: :ok
    end
    def show
        hero = Hero.find(params[:id])
        render json: hero, status: :ok
    end
end
