def basic_pass(path) 
  username = ENV["BASIC_AUTH_USER"] 
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

require 'rails_helper'

RSpec.describe "案件登録機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @matter = FactoryBot.build(:matter)
    @client = FactoryBot.build(:client)
    @sales_staff = FactoryBot.build(:sales_staff)
  end
  
  it 'ログイン状態でトップページから案件登録ができる' do
    sign_in(@user)
    expect(current_path).to eq root_path
    click_on("案件登録")
    expect(current_path).to eq new_matter_path
    fill_in 'matter_name', with: @matter.matter_name
    fill_in 'matter_explain', with: @matter.matter_explain
    fill_in 'product', with: @matter.product
    fill_in 'sale_price', with: @matter.sale_price
    fill_in 'profit_price', with: @matter.profit_price
    within '#matter_sale_time_1i' do
      select '2021'
    end
    within '#matter_sale_time_2i' do
      select '1'
    end
    within '#matter_priority_id' do
      select '高'
    end    
    within '#matter_reliability_id' do
      select '0%'
    end
    within '#matter_progress_id' do
      select '引き合い'
    end
    fill_in 'matter_occasion', with: @matter.occasion
    click_on("顧客情報登録へ")
    expect(current_path).to eq clients_path
    fill_in 'client_company', with: @client.company
    fill_in 'client_department', with: @client.department
    fill_in 'client_name', with: @client.name
    click_on("担当営業の登録へ")
    expect(current_path).to eq sales_staffs_path
    fill_in 'sales_department', with: @sales_staff.department
    fill_in 'staff', with: @sales_staff.staff
    click_on("登録")
    expect(current_path).to eq root_path
  end
end
