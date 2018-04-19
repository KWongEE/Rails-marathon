class MembersController < ApplicationController
  def new
    @house = House.find(params[:house_id])
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    @house = House.find(params[:house_id])
    @member.house = @house

    if @member.save
      redirect_to house_path(@house)
      flash[:message] = "Member added successfully"
    else
      render :new
      
    end
  end

  private
  def member_params
    params.require(:member).permit(:first_name,:last_name)
  end
end
