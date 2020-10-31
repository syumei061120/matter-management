class ClientsController < ApplicationController
    before_action :matter_find, only: [:index, :create, :edit, :update]
    before_action :client_find, only: [:edit, :update, :destroy]

    def index
    @matter_clients = MatterClient.where(matter_id: params[:matter_id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.valid?
      @client.save
      MatterClient.create(matter_id: params[:matter_id], client_id: @client.id)
      redirect_to matter_path(id: params[:matter_id])
    else
      render :new
    end
  end
  
  def update
    if @client.update(client_params)
      redirect_to matter_path(id: params[:matter_id])
    else
      render :edit
    end
  end

  def destroy
    @matter_client = MatterClient.find_by(matter_id: params[:matter_id], client_id: params[:id])
    if MatterClient.where(matter_id: params[:matter_id]).count == 1 
      flash[:failure] = '顧客情報が一件のため削除できませんでした'
    elsif MatterClient.where(client_id: params[:id]).count == 1 
      @matter_client.destroy
      @client.destroy
      flash[:success] = '顧客情報を削除しました'
    else
      @matter_client.destroy
      flash[:success] = '顧客情報を削除しました'
    end
    redirect_to matter_path(id: params[:matter_id])
  end

  private
  def client_params
    params.require(:client).permit(:company, :department, :name)
  end

  def matter_find
    @matter = Matter.find(params[:matter_id])
  end

  def client_find
    @client = Client.find(params[:id])
  end
end
