class PeopleController < ApplicationController
  before_filter :find_page, only: [:show, :edit, :update, :destroy]

  def index
    @people = People.all
    @users = User.all
  end

  def new
  end

  def create
    @person = People.new(person_params)
    @person.save
    @user = User.invite!({:email => @person.email}, current_user)
    @person.user_id = @user.id
    @person.status = 'Invited'
    @person.save
    redirect_to people_path, notice: "Person invited!"
  end

  def edit
  end

  def show
  end

  def update
    @person = People.find(params[:id])
    if @person.update_attributes(people_params)
      redirect_to people_path, :notice => "Person updated."
    else
      redirect_to people_path, :alert => "Unable to update person."
    end
  end

  def destroy
    @person.destroy
    redirect_to people_path, :notice => "Person deleted sucessfully."
  end

private

  def find_page
    @person = People.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name,:phone, :email, :position, :id, :user_id, :status)
  end

  def people_params
    params.require(:people).permit(:name,:phone, :email, :position, :id, :user_id, :status)
  end

end
