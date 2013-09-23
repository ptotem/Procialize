class ExhibitorController < ApplicationController
  def index
   @exhibitor=Exhibitor.all
  end

  def show
    @exhibitor=Exhibitor.find(params[:id])
    @exhi_name=@exhibitor.name
    @exhi_industry=@exhibitor.industry
    @exhi_description=@exhibitor.description
    @exhi_stall=@exhibitor.stall_no
    @exhi_stall=@exhibitor.contact_no

    @user_id=Array.new
    @exhi_user=ExhibitorUser.find_all_by_exhibitor_id(@exhibitor.id)
    @exhi_user.each do |u|
       @user_id<<u.user_id
    end

    @user_name=User.find(@user_id)


  end
end
