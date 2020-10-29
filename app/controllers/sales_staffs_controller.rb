class SalesStaffsController < ApplicationController
  before_action :sales_staff_find, only: [:show, :edit, :update]

  def update
    if @sales_staff.update(sales_staff_params)
      redirect_to matter_path
    else
      render :edit
    end
  end

  private
  def sales_staff_params
    params.require(:sales_staff).permit(:department, :staff)
  end

  def sales_staff_find
    @sales_staff = SalesStaff.find(params[:id])
  end
end
