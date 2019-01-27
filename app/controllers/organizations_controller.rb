class OrganizationsController < ApplicationController
  
  def index
    @organizations = Organization.all.order('created_at DESC')
  end

  def new
    
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.save

    redirect_to @organization
  end

  def show
    @organization = Organization.find(params[:id])
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :phone, :email, :website, :logo)
  end
end
