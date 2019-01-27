class PersonsController < ApplicationController
  before_action :find_person, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @persons = Person.all.order('created_at DESC')
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    
    if @person.save
      redirect_to @person
    else
      render 'new'
    end
  end

  def show
    
  end

  def edit 
    
  end
  
  def update
    if @person.update(person_params)
        redirect_to @person
    else
        render 'edit'
    end
  end
  
  def destroy
    @person.destroy
    
    redirect_to root_path
  end

  private

  def find_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :phone, :email, :avatar)
  end

end
