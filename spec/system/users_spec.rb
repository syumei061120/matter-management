def basic_pass(path) 
  username = ENV["BASIC_AUTH_USER"] 
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  it '正しい情報を入力するとユーザー新規登録ができてTOPページに移動する' do
    basic_pass new_user_session_path
    expect(page).to have_content('＞＞新規利用登録はこちら')    
    visit new_user_registration_path
    image_path =Rails.root.join ('app/assets/images/sample1.png')
    attach_file('user_image', image_path)
    fill_in 'family_name', with: @user.family_name
    fill_in 'first_name', with: @user.first_name
    fill_in 'family_name_kana', with: @user.family_name_kana
    fill_in 'first_name_kana', with: @user.first_name_kana
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    fill_in 'user_password_confirmation', with: @user.password_confirmation
    find('option[value="1"]').select_option
    expect{
      find('input[name="commit"]').click
    }.to change { User.count }.by(1)
    expect(current_path).to eq root_path
    expect(page).to have_content("#{@user.family_name}さんのマイページ")
    expect(page).to have_selector("img[src$='sample1.png']")
  end

  it 'フォームに正しく入力されないとユーザー新規登録ができず、新規登録画面に戻る' do
    basic_pass new_user_session_path
    expect(page).to have_content('＞＞新規利用登録はこちら')    
    visit new_user_registration_path
    fill_in 'family_name', with: ""
    fill_in 'first_name', with: ""
    fill_in 'family_name_kana', with: ""
    fill_in 'first_name_kana', with: ""
    fill_in 'user_email', with: ""
    fill_in 'user_password', with: ""
    fill_in 'user_password_confirmation', with: ""
    find('option[value="0"]').select_option
    expect{
      find('input[name="commit"]').click
    }.to change { User.count }.by(0)
    expect(current_path).to eq "/users"
  end
end

RSpec.describe "ユーザーログイン機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  it 'ログインしていない状態でTOPページにアクセスするとログインページに移動する' do
    basic_pass new_user_session_path
    visit root_path
    expect(current_path).to eq new_user_session_path
  end

  it 'ログインに成功するとトップページに移動する' do
    sign_in(@user)
    expect(current_path).to eq root_path
  end

  it 'ログインに失敗するとログインページに移動する' do
    basic_pass new_user_session_path
    visit new_user_session_path
    expect(current_path).to eq new_user_session_path
    fill_in 'user_email', with: "test"
    fill_in 'user_password', with: "test"
    click_on("ログイン")
    expect(current_path).to eq new_user_session_path
  end
end
RSpec.describe "ユーザー情報編集機能", type: :system do
  it 'マイページからユーザー情報を編集できる' do
    @user_edited = FactoryBot.build(:user)
    @user = FactoryBot.create(:user)
    sign_in(@user)
    expect(current_path).to eq root_path
    expect(page).to have_content("#{@user.family_name}さんのマイページ")
    click_on("#{@user.family_name}さんのマイページ")
    expect(current_path).to eq user_path(@user.id)
    click_on("ユーザー情報編集")
    image_path =Rails.root.join ('app/assets/images/sample2.png')
    attach_file('user_image', image_path)
    fill_in 'family_name', with: @user_edited.family_name
    fill_in 'first_name', with: @user_edited.first_name
    fill_in 'family_name_kana', with: @user_edited.family_name_kana
    fill_in 'first_name_kana', with: @user_edited.first_name_kana
    fill_in 'user_email', with: @user_edited.email
    find('option[value="1"]').select_option
    click_on("編集")
    expect(current_path).to eq user_path(@user.id)
    expect(page).to have_content(@user_edited.family_name)
    expect(page).to have_content(@user_edited.first_name)
    expect(page).to have_selector("img[src$='sample2.png']")
    expect(page).to have_content(@user_edited.email)
  end
end
