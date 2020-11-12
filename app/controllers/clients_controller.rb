class ClientsController < ApplicationController
  before_action :matter_find, only: [:index, :new, :edit, :update, :destroy]
  before_action :client_find, only: [:edit, :update, :destroy]
  before_action :client_first, only: [:create, :update]
  before_action :matter_client_find, only: [:create, :update]
  after_action :updated_daytime_edit, only: [:create, :update]

  def index
    @matter_clients = MatterClient.where(matter_id: params[:matter_id])
  end

  def new
    unless current_user.administrator_id == 2 || @matter.user == current_user
      redirect_to matter_clients_path(matter_id: params[:matter_id])
    end
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    render :new and return unless @client.valid?

    if @matter_client.present?
      flash[:client_not_unique] = '登録済みの顧客情報です'
      render :new and return
    elsif @client_first.valid?
      @client_first.save
      MatterClient.create(matter_id: params[:matter_id], client_id: @client_first.id)
      redirect_to matter_clients_path(matter_id: params[:matter_id])
    else
      render :new and return
    end
  end

  def edit
    unless current_user.administrator_id == 2 || @matter.user == current_user
      redirect_to matter_clients_path(matter_id: params[:matter_id])
    end
  end

  def update
    if @matter_client.present?
      flash[:client_not_unique] = '登録済みの顧客情報です'
      render :edit and return
    elsif MatterClient.where(client_id: params[:id]).count == 1
      @client_first.save
      @client.destroy
      matter_client = MatterClient.new(matter_id: params[:matter_id], client_id: @client_first.id)
      matter_client.update(matter_id: params[:matter_id], client_id: @client_first.id)
      redirect_to matter_clients_path(matter_id: params[:matter_id])
    elsif @client_first.valid?
      @client_first.save
      matter_client = MatterClient.find_by(matter_id: params[:matter_id], client_id: params[:id])
      matter_client.update(matter_id: params[:matter_id], client_id: @client_first.id)
      redirect_to matter_clients_path(matter_id: params[:matter_id])
    else
      flash[:client_not_editted] = '編集できませんでした'
      render :edit and return
    end
  end

  def destroy
    unless current_user.administrator_id == 2 || @matter.user == current_user
      redirect_to matter_clients_path(matter_id: params[:matter_id])
    end
    @matter_client = MatterClient.find_by(matter_id: params[:matter_id], client_id: params[:id])
    path = Rails.application.routes.recognize_path(request.referer)
    if MatterClient.where(matter_id: params[:matter_id]).count == 1
      flash[:client_failure] = '顧客情報が一件のため削除できませんでした'
    elsif MatterClient.where(client_id: params[:id]).count == 1
      @matter_client.destroy
      @client.destroy
      flash[:client_success] = '顧客情報を削除しました'
    else
      @matter_client.destroy
      flash[:client_success] = '顧客情報を削除しました'
    end

    if path[:controller] == 'matters' && path[:action] == 'show'
      redirect_to matter_path(id: params[:matter_id])
    elsif path[:controller] == 'clients' && path[:action] == 'index'
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
    @matter_client = MatterClient.find_by(matter_id: params[:matter_id], client_id: @client_first.id)
  end

  def client_first
    @client_first = Client.where(company: params[:client][:company], department: params[:client][:department], name: params[:client][:name]).first_or_initialize
  end

  def updated_daytime_edit
    require 'date'
    @matter = Matter.find(params[:matter_id])
    @matter.update(updated_daytime: DateTime.now)
  end
end
