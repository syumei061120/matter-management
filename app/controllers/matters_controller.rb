class MattersController < ApplicationController
  before_action :matter_find, only: [:show, :edit, :update, :destroy]

  def index
    @matters = Matter.includes(:user).all.order(updated_at: 'DESC')
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
    @priority_id = Priority.where.not(id: 0)
    @reliability_id = Reliability.where.not(id: 0)
    @progress_id = Progress.where.not(id: 0)
    if params[:commit] == 'リセット'
      @q = Matter.ransack
      @matters = @q.result
    elsif params[:user_id].present?
      user = User.find(params[:user_id])
      params[:q] = { user_family_name_or_user_first_name_cont: user.family_name + user.first_name }
      @matters = Matter.where(user_id: user.id)
      @q = Matter.ransack(params[:q])
    elsif params[:q].present?
      if params[:q][:user_family_name_or_user_first_name_cont].present?
        users = User.where('concat(family_name, first_name) LIKE(?)', "%#{params[:q][:user_family_name_or_user_first_name_cont]}%")
        @matters = Matter.where(user_id: users.ids)
        @q = Matter.ransack(params[:q])
      else
        @q = Matter.ransack(params[:q])
        @matters = @q.result
      end
    else
      params[:q] = { sorts: 'id desc' }
      @q = Matter.ransack
      @matters = @q.result
    end
  end

  def destroy
    @sales_staff = SalesStaff.find(@matter.sales_staff_id)
    @matter_clients = MatterClient.where(matter_id: params[:id])
    @matter_clients.each do |matter_client|
      if MatterClient.where(client_id: matter_client.client_id).count == 1
        @client = Client.find(matter_client.client_id)
        @client.destroy
      end
    end
    @matter.destroy
    @sales_staff.destroy unless Matter.where(sales_staff_id: @sales_staff.id).present?
    redirect_to root_path
  end

  private

  def matter_params
    require "date"
    params.require(:matter).permit(:matter_name, :matter_explain, :product, :sale_price, :profit_price, :sale_time, :priority_id, :reliability_id, :progress_id, :occasion).merge(user_id: current_user.id, updated_daytime: DateTime.now)
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
