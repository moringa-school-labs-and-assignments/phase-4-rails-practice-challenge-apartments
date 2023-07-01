class ApartmentsController < ApplicationController
    def index
        apartments = Apartment.all 
        render json: apartments, status: :ok
    end
    
    def show
        apartment = Apartment.find_by(id: params[:id])
        render json: apartment, status: :ok
    end
    
    def create
        apartment = Apartment.new(apartment_params)

        if apartment.save
            render json: apartment, status: :ok
        else
            render json:  {errors:"Invalid input" }, status: :unprocessable_entity
        end
    end

    def update
        apartment = Apartment.find(params[:id])
        
        if apartment.update(apartment_params)
            render json: apartment, status: :ok
        else
            render json: { errors: "Invalid input" }, status: :unprocessable_entity
        end
    end
    
    def destroy
        apartment = Apartment.find(params[:id])

        if apartment.destroy
            head :no_content, status: :ok
        else
            render json: {errors:"Not found"}
        end
    end
    

    private

    def apartment_params
        params.permit(:number)
    end  
end
