class MattersController < ApplicationController
  before_action :matter_find, only: [:show, :edit, :update]

  def index
    @matters = Matter.all.order(created_at: "DESC")
  end

  def new
    @matter = Matter.new
  end

  def create
    @matter = Matter.new(matter_params)
    render :new and return unless @matter.valid?

    session['matter_data'] = { matter: @matter.attributes }
    @client = Client.new
    render :new_client
  end

  def create_client
    @client = Client.new(client_params)
    render :new_client and return unless @client.valid?

    session['client_data'] = { client: @client.attributes }
    @sales_staff = SalesStaff.new
    render :new_sales_staff
  end

  def create_sales_staff
    @matter = Matter.new(session['matter_data']['matter'])
    @client = Client.new(session['client_data']['client'])
    @sales_staff = SalesStaff.new(sales_staff_params)

    render :new_sales_staff and return unless @sales_staff.valid?

    @sales_staff.save
    @matter.sales_staff_id = @sales_staff.id
    @matter.save
    @client.save
    MatterClient.create(matter_id: @matter.id, client_id: @client.id)
    redirect_to root_path
  end

  def update
    if @matter.update(matter_params)
      redirect_to matter_path(@matter)
    else
      render :edit
    end
  end

  def search
  end

  private

  def matter_params
    params.require(:matter).permit(:matter_name, :matter_explain, :product, :sale_price, :profit_price, :sale_time, :priority_id, :reliability_id, :progress_id, :occasion, :staff_in_charge, :is_edited).merge(user_id: current_user.id)
  end

  def client_params
    params.require(:client).permit(:company, :department, :name)
  end

  def sales_staff_params
    params.require(:sales_staff).permit(:department, :staff)
  end

  def matter_find
    @matter = Matter.find(params[:id])
  end
end
