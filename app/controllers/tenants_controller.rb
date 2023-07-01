class TenantsController < ApplicationController
    def index
        tenants = Tenant.all 
        render json: tenants, status: :ok
    end

    def show
        tenant = Tenant.find_by(id: params[:id])
        render json: tenant, status: :ok
    end

    def create
        tenant = Tenant.new(tenant_params)

        if tenant.save
            render json: tenant, status: :ok
        else
            render json:  {errors:"Invalid input" }, status: :unprocessable_entity
        end
    end

    def update
        tenant = Tenant.find(params[:id])

        if tenant.update(tenant_params)
            render json: tenant, status: :ok
        else
            render json: { errors: "Invalid input" }, status: :unprocessable_entity
        end
    end

    def destroy
        tenant = Tenant.find(params[:id])

        if tenant.destroy
            head :no_content, status: :ok
        else
            render json: {errors:"Not found"}
        end
    end


    private

    def tenant_params
        params.permit(:name, :age)
    end  
end
