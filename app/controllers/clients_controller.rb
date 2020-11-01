class ClientsController < ApplicationController
    before_action :matter_find, only: [:index, :create, :edit, :update]
    before_action :client_find, only: [:edit, :update, :destroy]
    before_action :matter_client_find, only: [:update, :destroy]

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
      redirect_to matter_clients_path(matter_id: params[:matter_id])
    else
      render :new
    end
  end
  
  def update
    if MatterClient.where(client_id: params[:id]).count == 1 
      if @client.update(client_params)
        redirect_to matter_clients_path(matter_id: params[:matter_id])
      else
        render :edit
      end
    else
      @client = Client.new(client_params)
      if @client.valid?
        @client.save
        @matter_client.update(matter_id: params[:matter_id], client_id: @client.id)
        redirect_to matter_clients_path(matter_id: params[:matter_id])
      else
        render :edit
      end
    end
  end

  def destroy
    path = Rails.application.routes.recognize_path(request.referer)
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

    if path[:controller] == "matters" && path[:action] == "show"
      redirect_to matter_path(id: params[:matter_id])
    elsif path[:controller] == "clients" && path[:action] == "index"
      redirect_to matter_clients_path(matter_id: params[:matter_id])
    else
      redirect_to root_path
    end
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

  def matter_client_find
    @matter_client = MatterClient.find_by(matter_id: params[:matter_id], client_id: params[:id])
  end
end
