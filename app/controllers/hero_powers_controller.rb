class HeroPowersController < ApplicationController
    def create
        hero_power = HeroPower.create(strength: params[:strength], hero_id: params[:hero_id], power_id: params[:power_id])
        render json: hero_power, status: :created
    end
end
