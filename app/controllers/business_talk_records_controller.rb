class BusinessTalkRecordsController < ApplicationController

  def index
    @matter = Matter.find(params[:matter_id])
    @business_talk_records = BusinessTalkRecord.where(matter_id: params[:matter_id]).order(end: "DESC")
  end

  def new
    @business_talk_record = BusinessTalkRecord.new
  end

  def create
    @business_talk_record = BusinessTalkRecord.new(business_talk_record_params)
    render :new and return unless @business_talk_record.valid?
    if params[:business_talk_record][:start] > params[:business_talk_record][:end]
      flash[:incorrect_time] = '開始時刻は終了時刻より前の日時を設定して下さい'
      render :new
    else
      @business_talk_record = BusinessTalkRecord.new(business_talk_record_params)
      render :new and return unless @business_talk_record.valid?
      @business_talk_record.save
      redirect_to matter_business_talk_records_path
    end
  end

  def edit
    @business_talk_record = BusinessTalkRecord.find(params[:id])
  end

  def update
    @business_talk_record = BusinessTalkRecord.find(params[:id])
    if params[:business_talk_record][:start] > params[:business_talk_record][:end]
      flash[:incorrect_time] = '開始時刻は終了時刻より前の日時を設定して下さい'
      render :edit and return
    end
    if params[:business_talk_record][:file_ids].present?
      params[:business_talk_record][:file_ids].each do |file_id|
        file = @business_talk_record.files.find(file_id)
        file.purge
      end
    end
    if params[:business_talk_record][:files].present?
      @business_talk_record.files.attach(params[:business_talk_record][:files])
      @business_talk_record.assign_attributes(start: params[:business_talk_record][:start], end: params[:business_talk_record][:end], explain: params[:business_talk_record][:explain])
      @business_talk_record.save
      redirect_to matter_business_talk_records_path
    else
      @business_talk_record.update(business_talk_record_params)
      redirect_to matter_business_talk_records_path
    end
  end

  def destroy
    @business_talk_record = BusinessTalkRecord.find(params[:id])
    path = Rails.application.routes.recognize_path(request.referer)
    @business_talk_record.destroy
    flash[:business_talk_record_success] = '商談情報を削除しました'

    if path[:controller] == "matters" && path[:action] == "show"
      redirect_to matter_path(id: params[:matter_id])
    elsif path[:controller] == "business_talk_records" && path[:action] == "index"
      redirect_to matter_business_talk_records_path(matter_id: params[:matter_id])
    else
      redirect_to root_path
    end
  end

  private
  def business_talk_record_params
    params.require(:business_talk_record).permit(:start, :end, :explain, files: []).merge(user_id: current_user.id, matter_id: params[:matter_id])
  end
end
