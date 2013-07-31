class UserImportsController < ApplicationController

def new
  @user_import=UserImport.new
  render :layout => "application1"
end




require 'spreadsheet'

def excel_imp
  @user_sheet = UserImport.create(:user_details => params[:user_import][:user_details])
  @user_sheet.save
  @users=Array.new
  @participants=Array.new
  Spreadsheet.client_encoding = 'UTF-8'
  book = Spreadsheet.open "#{@user_sheet.user_details.path}"
  sheet1 = book.worksheet 0


  sheet1.each_with_index do |row, index|
    if index>0
      @users<<User.create!(:email=> row[0], :password => row[1], :password_confirmation => row[2], :name => row[3],:headline => row[4],:industry => row[5],:location => row[6],:company => row[7],:interest => row[8],:skills => row[9])
    end
  end
  redirect_to "/organizer/user"
end





end
