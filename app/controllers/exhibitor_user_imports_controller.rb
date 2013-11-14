class ExhibitorUserImportsController < ApplicationController

  def new
    @exhibitor_user_import = ExhibitorUserImport.new
    render :layout => "application1"
  end

  require 'spreadsheet'
  def exhibitor_user_excel_imp
    @exhibitor_user_sheet = ExhibitorUserImport.create(:exhibitor_user_details => params[:exhibitor_user_import][:exhibitor_user_details])
    @exhibitor_user_sheet.save
    @exhibitor_users=Array.new
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open "#{@exhibitor_user_sheet.exhibitor_user_details.path}"
    sheet1 = book.worksheet 0


    sheet1.each_with_index do |row, index|
      if index>0
        @exhibitor_users<<ExhibitorUser.create!(:user_id=> User.find_by_name(row[0].id), :exhibitor_id => Exhibitor.find_by_name(row[1].id))
      end
    end
    redirect_to "/organizer/exhibitor_user_import"
  end


end
