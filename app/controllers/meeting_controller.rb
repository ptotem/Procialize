class MeetingController < ApplicationController

  def index
     @user=current_user
     @meetings = Meeting.all
     #@meetings = Meeting.find(params[:id])
     @meeters = Meeter.find_all_by_user_id(@user)
     @meetings =Array.new
     @meeters.each do |meeters|
       @meetings<<Meeting.find(meeters.meeting_id)
     end


  end

   def show
     #@meetings = Meeting.find(params[:id])
   end

 
  def new

  end

  def new_resp

  end

  def show_resp

  end

  
end
