class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, status: :ok
    end

    def create
        camper = Camper.create(camper_params)
        render json: camper, status: :created
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

    def render_record_not_found_response
        render json: { error: "Camper not found" }
    end
end
