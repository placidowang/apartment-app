class TenantsController < ApplicationController
  # add controller methods
  set :views, "app/views/tenants"

  get "/tenants" do
    @tenants = Tenant.all
    erb :index
  end

  get "/tenants/new" do
    @apartments = Apartment.all
    erb :new
  end

  get "/tenants/:id" do
    @tenant = current_tenant
    erb :show
  end

  get "/tenants/:id/edit" do
    @tenant = current_tenant
    @apartments = Apartment.all
    # binding.pry
    erb :edit
  end

  post "/tenants" do
    t = Tenant.create(params)
    redirect "/tenants/#{t.id}"
    # redirect "/tenants"
  end

  delete "/tenants/:id" do
    current_tenant.destroy
    redirect "/tenants"
  end

  patch "/tenants/:id" do
    # author = Author.find(params[:id])
    # author.update(name: params[:name])
    current_tenant.update(name: params[:name], apartment_id: params[:apartment_id])
    redirect "/tenants"
  end
  
  def current_tenant
    Tenant.find(params[:id])
  end
end
