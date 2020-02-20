class ApartmentsController < ApplicationController
  # add controller methods
  set :views, "app/views/apartments"

  get "/apartments" do
    @apartments = Apartment.all
    erb :index
  end

  get "/apartments/new" do
    erb :new
  end

  get "/apartments/:id" do
    @apartment = current_apartment
    # @tenants = Tenant.all.select {|tenant| tenant.apartment_id == @apartment.id}
    erb :show
  end

  get "/apartments/:id/edit" do
    @apartment = current_apartment
    # binding.pry
    erb :edit
  end

  # post "/apartments/:id" do
    
  # end





  post "/apartments" do
    a = Apartment.create(params)
    redirect "/apartments/#{a.id}"
  end

  delete "/apartments/:id" do
    current_apartment.destroy
    redirect "/apartments"
  end


  patch "/apartments/:id" do
    # author = Author.find(params[:id])
    # author.update(name: params[:name])
    current_apartment.update(address: params[:address])
    redirect "/apartments"
  end
  
  def current_apartment
    Apartment.find(params[:id])
  end
end
