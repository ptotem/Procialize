class ExhibitorImportsController < ApplicationController

  def new
    @exhibitor_import = ExhibitorImport.new
    render :layout => "application1"
  end



  require 'spreadsheet'
  def exhibitor_excel_imp
    @exhibitor_sheet = ExhibitorImport.create!(:exhibitor_details => params[:exhibitor_import][:exhibitor_details])
    @exhibitor_sheet.save
    @exhibitors=Array.new
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open "#{@exhibitor_sheet.exhibitor_details.path}"
    sheet1 = book.worksheet 0
    sheet2 = book.worksheet 1


    sheet1.each_with_index do |row, index|
      if index>0
        @exhibitors<<Exhibitor.create!(:name=> row[0], :industry => row[1], :stall_no => row[2], :description => row[3], :brouchers => File.open(row[4]), :broucher2 => File.open(row[5]),:exhi_logo => File.open(row[6]))
      end
    end

    #sheet2.each_with_index do |row, index|
    #  if index>0
    #    @exhibitor_user<<ExhibitorUser.create!()
    #  end
    #end
    redirect_to "/organizer/exhibitor"
  end


end
