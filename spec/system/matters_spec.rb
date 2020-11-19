def basic_pass(path) 
  username = ENV["BASIC_AUTH_USER"] 
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

require 'rails_helper'

# RSpec.describe "案件登録機能", type: :system do
#   before do
#     @user = FactoryBot.create(:user)
#     @matter = FactoryBot.build(:matter)
#     @client = FactoryBot.build(:client)
#     @sales_staff = FactoryBot.build(:sales_staff)
#   end
  
#   it 'ログイン状態でトップページから案件登録ができる' do
#     sign_in(@user)
#     expect(current_path).to eq root_path
#     click_on("案件登録")
#     expect(current_path).to eq new_matter_path
#     fill_in 'matter_name', with: @matter.matter_name
#     fill_in 'matter_explain', with: @matter.matter_explain
#     fill_in 'product', with: @matter.product
#     fill_in 'sale_price', with: @matter.sale_price
#     fill_in 'profit_price', with: @matter.profit_price
#     within '#matter_sale_time_1i' do
#       select '2021'
#     end
#     within '#matter_sale_time_2i' do
#       select '1'
#     end
#     within '#matter_priority_id' do
#       select '高'
#     end    
#     within '#matter_reliability_id' do
#       select '0%'
#     end
#     within '#matter_progress_id' do
#       select '引き合い'
#     end
#     fill_in 'matter_occasion', with: @matter.occasion
#     click_on("顧客情報登録へ")
#     expect(current_path).to eq clients_path
#     fill_in 'client_company', with: @client.company
#     fill_in 'client_department', with: @client.department
#     fill_in 'client_name', with: @client.name
#     click_on("担当営業の登録へ")
#     expect(current_path).to eq sales_staffs_path
#     fill_in 'sales_department', with: @sales_staff.department
#     fill_in 'staff', with: @sales_staff.staff
#     click_on("登録")
#     expect(current_path).to eq root_path
#     expect(page).to have_content(@matter.matter_name)
#   end

#   it '案件情報が正しく入力されないと登録できない' do
#     sign_in(@user)
#     expect(current_path).to eq root_path
#     click_on("案件登録")
#     expect(current_path).to eq new_matter_path
#     fill_in 'matter_name', with: ""
#     fill_in 'matter_explain', with: ""
#     fill_in 'product', with: ""
#     fill_in 'sale_price', with: ""
#     fill_in 'profit_price', with: ""
#     within '#matter_sale_time_1i' do
#       select '2021'
#     end
#     within '#matter_sale_time_2i' do
#       select '1'
#     end
#     within '#matter_priority_id' do
#       select '--'
#     end    
#     within '#matter_reliability_id' do
#       select '--'
#     end
#     within '#matter_progress_id' do
#       select '--'
#     end
#     fill_in 'matter_occasion', with: ""
#     click_on("顧客情報登録へ")
#     expect(current_path).to eq "/matters"
#   end

#     it '顧客情報が正しく入力されないと登録できない' do
#     sign_in(@user)
#     expect(current_path).to eq root_path
#     click_on("案件登録")
#     expect(current_path).to eq new_matter_path
#     fill_in 'matter_name', with: @matter.matter_name
#     fill_in 'matter_explain', with: @matter.matter_explain
#     fill_in 'product', with: @matter.product
#     fill_in 'sale_price', with: @matter.sale_price
#     fill_in 'profit_price', with: @matter.profit_price
#     within '#matter_sale_time_1i' do
#       select '2021'
#     end
#     within '#matter_sale_time_2i' do
#       select '1'
#     end
#     within '#matter_priority_id' do
#       select '高'
#     end    
#     within '#matter_reliability_id' do
#       select '0%'
#     end
#     within '#matter_progress_id' do
#       select '引き合い'
#     end
#     fill_in 'matter_occasion', with: @matter.occasion
#     click_on("顧客情報登録へ")
#     expect(current_path).to eq clients_path
#     fill_in 'client_company', with: ""
#     fill_in 'client_department', with: ""
#     fill_in 'client_name', with: ""
#     click_on("担当営業の登録へ")
#     expect(current_path).to eq "/clients"
#   end

#   it '担当営業情報が正しく入力されないと登録できない' do
#     sign_in(@user)
#     expect(current_path).to eq root_path
#     click_on("案件登録")
#     expect(current_path).to eq new_matter_path
#     fill_in 'matter_name', with: @matter.matter_name
#     fill_in 'matter_explain', with: @matter.matter_explain
#     fill_in 'product', with: @matter.product
#     fill_in 'sale_price', with: @matter.sale_price
#     fill_in 'profit_price', with: @matter.profit_price
#     within '#matter_sale_time_1i' do
#       select '2021'
#     end
#     within '#matter_sale_time_2i' do
#       select '1'
#     end
#     within '#matter_priority_id' do
#       select '高'
#     end    
#     within '#matter_reliability_id' do
#       select '0%'
#     end
#     within '#matter_progress_id' do
#       select '引き合い'
#     end
#     fill_in 'matter_occasion', with: @matter.occasion
#     click_on("顧客情報登録へ")
#     expect(current_path).to eq clients_path
#     fill_in 'client_company', with: @client.company
#     fill_in 'client_department', with: @client.department
#     fill_in 'client_name', with: @client.name
#     click_on("担当営業の登録へ")
#     expect(current_path).to eq sales_staffs_path
#     fill_in 'sales_department', with: ""
#     fill_in 'staff', with: ""
#     click_on("登録")
#     expect(current_path).to eq sales_staffs_path
#   end
# end

RSpec.describe "案件情報編集機能", type: :system do
  it '案件情報の編集ができる' do
    @user = FactoryBot.create(:user)
    @matter = FactoryBot.build(:matter)
    @client = FactoryBot.build(:client)
    @sales_staff = FactoryBot.build(:sales_staff)
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

    expect(page).to have_content(@matter.matter_name)
    click_on(@matter.matter_name)
    click_on("案件情報編集")
    @matter_edited = FactoryBot.build(:matter)
    fill_in 'matter_name', with: @matter_edited.matter_name
    fill_in 'matter_explain', with: @matter_edited.matter_explain
    fill_in 'product', with: @matter_edited.product
    fill_in 'sale_price', with: @matter_edited.sale_price
    fill_in 'profit_price', with: @matter_edited.profit_price
    click_on("案件情報編集")
    expect(page).to have_content(@matter_edited.matter_name)
    expect(page).to have_content(@matter_edited.matter_explain)
    expect(page).to have_content(@matter_edited.product)
  end

end
