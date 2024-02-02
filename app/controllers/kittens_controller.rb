class KittensController < ApplicationController
    def index
        @kittens = Kitten.all
        respond_to do |format|
            format.json {render :json => @kittens}
        end
    end

    def new
        @kitten = Kitten.new
    end

    def create
        @kitten = Kitten.new(kitten_params)
        if @kitten.save
            redirect_to @kitten, notice: "You've created a new kitten, meow!"
        else
            render :new, status: :unprocessable_entity 
        end
    end

    def show
        @kitten = Kitten.find(params[:id])
        respond_to do |format|
            format.json {render :json => @kitten}
        end
    end

    def edit
        @kitten = Kitten.find(params[:id])
    end

    def update
        @kitten = Kitten.find(params[:id])
        if @kitten.update(kitten_params)
            redirect_to @kitten, notice: "You've updated your kitten!"
        else
            flash.alert = "Your cat is too cute or too soft"
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @kitten = Kitten.find(params[:id])
        @kitten.destroy
        redirect_to root_path, notice: "You've deleted your kitten :("
    end


    private
    
    def kitten_params
        params.require(:kitten).permit(:name, :age,:cuteness,:softness)
    end
end
