class Api::V1::ChoresController < ApplicationController
    before_action :find_chore, only: [:index, :show, :create, :update, :destroy]

    def index
        @chores = Chore.all 
        render json: @chores
    end

    def show
        render json: @chore
    end

    def create
        @chore = Chore.new(chore_params)
        if @chore.save
            render json: @chore
        else
            render error: { error: "Unable to create."}, status: 400
        end
    end

    def update
        if @chore
            @chore.update(chore_params)
            render json: { message: "chore has been updated"}, status: 200
        else
            render json: { error: "Unable to update"}, status: 400
        end
    end

    def destroy
        if @chore
            @chore.destroy
            render json: { message: "Chore complete! Yay!"}, status: 200
        else
            render json: { error: "Unable to delete, try again!"}, status: 400
        end
    end

    private

    def chore_params
        params.require(:chore).permit(:chore, :kid_id)
    end

    def find_chore
        @chore = Chore.find(params[:id])
    end

end
