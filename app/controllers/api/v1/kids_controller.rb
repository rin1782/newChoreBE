class Api::V1::KidsController < ApplicationController
    before_action :find_kid, only: [:index, :show, :create, :destroy]

    def index
        @kids = Kid.all 
        render json: @kids
    end

    def show
        render json: @kid
    end

    def create
        @kid = Kid.new(kid_params)
        if @kid.save
            render json: @kid
        else
            render error: {error: "Unable to create."}, status: 400
        end
    end

    def destroy 
        if @kid
            @kid.destroy
            render json: {message: "Successfully removed from list."}, status: 200
        else
            render json: {error: "Unable to delete."}, status: 400
    end

    private

    def kid_params
        params.require(:kid).permit(:id, :name)
    end

    def find_kid
        @kid = Kid.find(params[:id])
    end

end
