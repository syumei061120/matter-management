class SalesStaffsController < ApplicationController
  after_action :updated_daytime_edit, only: [:update]

  def edit
    @matter = Matter.find(params[:matter_id])
    unless current_user.administrator_id == 2 || @matter.user == current_user
      redirect_to matter_clients_path(matter_id: params[:matter_id])
    end
    @sales_staff = SalesStaff.find(params[:id])
  end

  def update
    @sales_staff = SalesStaff.where(sales_staff_params).first_or_initialize
    @matter = Matter.find(params[:matter_id])
    if @sales_staff.valid?
      @sales_staff.save
      @matter.assign_attributes(sales_staff_id: @sales_staff.id)
      @matter.save
      unless Matter.where(sales_staff_id: params[:id]).present?
        sales_staff = SalesStaff.find(params[:id])
        sales_staff.destroy
      end
      redirect_to matter_path(id: params[:matter_id])
    else
      render :edit
    end
  end

  private

  def sales_staff_params
    params.require(:sales_staff).permit(:department, :staff)
  end

  def updated_daytime_edit
    require 'date'
    @matter = Matter.find(params[:matter_id])
    @matter.update(updated_daytime: DateTime.now)
  end
end
