class PethistoriesController < ApplicationController
  before_action :set_pethistory, only: %i[ show edit update destroy ]
  before_action :set_pet, only: %i[ show edit update destroy ]
  before_action :set_client, only: %i[ show edit update destroy ]

  # GET /pethistories or /pethistories.json
  def index
    @client = Client.find(params[:client_id])
    @pet = @client.pets.find(params[:pet_id])
    @pethistories = @pet.pethistories
  end

  # GET /pethistories/1 or /pethistories/1.json
  def show
  end

  # GET /pethistories/new
  def new
    @client = Client.find(params[:client_id])
    @pet = Pet.find(params[:pet_id])
    @pethistory = Pethistory.new
  end

  # GET /pethistories/1/edit
  def edit
  end

  # POST /pethistories or /pethistories.json
  def create
    @client = Client.find(params[:client_id])
    @pet = @client.pets.find(params[:pet_id])
    @pethistory = Pethistory.new(pethistory_params)
    @pethistory.pet = @pet

    respond_to do |format|
      if @pethistory.save
        format.html { redirect_to client_pet_pethistory_path(@client, @pet, @pethistory), notice: "Pethistory was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /pethistories/1 or /pethistories/1.json
  def update
    respond_to do |format|
      if @pethistory.update(pethistory_params.merge(pet: @pet))
        format.html { redirect_to client_pet_pethistory_path(@client, @pet, @pethistory), notice: "Pethistory was successfully updated." }
      else
        format.html { render :edit}
      end
    end
  end

  # DELETE /pethistories/1 or /pethistories/1.json
  def destroy
    @pethistory.destroy
    respond_to do |format|
      format.html { redirect_to client_pet_pethistories_url, notice: "Pethistory was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pethistory
      @pethistory = Pethistory.find(params[:id])
    end
      
    def set_pet
      @pet = Pet.find(params[:pet_id])
    end

    def set_client 
      @client = Client.find(params[:client_id])
    end

    # Only allow a list of trusted parameters through.
    def pethistory_params
      params.require(:pethistory).permit(:date, :weight, :height, :description)
    end
end
