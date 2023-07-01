class LeasesController < ApplicationController
  def create

    lease = Lease.new(lease_params)

    if lease.save
      render json: lease, status: :created
    else
      render json: lease.errors, status: :unprocessable_entity
    end
  end

  def destroy
    lease = Lease.find(params[:id])

    if lease.destroy
      head :no_content, status: :ok
    else
      render json: {errors:"Not found"}
    end
  end

  private

  def lease_params
    params.require(:lease).permit(:rent, :tenant_id, :apartment_id)
  end  
end
