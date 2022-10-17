class PowersController < ApplicationController
    def index
        render json: Power.all, status: :ok
    end
    def show
        power = Power.find(params[:id])
        render json: power, status: :ok
    end
    def update
        power = Power.find(params[:id])
        power.update(description: params[:description])
        render json: power, status: :ok
    end
end
