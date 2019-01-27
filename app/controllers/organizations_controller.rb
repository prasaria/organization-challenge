class OrganizationsController < ApplicationController
  
  before_action :find_orgs, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @organizations = Organization.all.order('created_at DESC')
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    
    if @organization.save
      redirect_to @organization
    else
      render 'new'
    end

    
  end

  def show
    
  end

  def edit 
    
  end
  
  def update
    if @organization.update(organization_params)
        redirect_to @organization
    else
        render 'edit'
    end
  end
  
  def destroy
    @organization.destroy
    
    redirect_to root_path
  end

  private

  def find_orgs
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name, :phone, :email, :website, :logo)
  end
end
