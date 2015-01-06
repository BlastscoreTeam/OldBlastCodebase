class BlastUsersController < ApplicationController
  def new
	@blastuser = BlastUser.new
  end
  def create
	@blastuser = BlastUser.new(params[:user])
    if @blastuser.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render "new"
  end
end
