class PowersController < ApplicationController

    def index
        render json: Power.all, status: :ok
    end
    
    def show
        power = find_power
        render json: power, status: :ok
    end
    def update
        power = find_power
        power.update!(update_params)
        render json: power, status: :ok
    end

    private

    def find_power
        Power.find(params[:id])
    end

    private

    def update_params
        params.permit(:description)
    end
end
