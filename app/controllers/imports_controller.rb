class ImportsController < ApplicationController
  before_action :set_import, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:new, :create]
  # GET /imports
  # GET /imports.json
  def index
    @imports = Import.all.order(created_at: :desc)
  end

  # GET /imports/1
  # GET /imports/1.json
  def show
  end

  # GET /imports/new
  def new
    @import = Import.new
  end

  # GET /imports/1/edit
  def edit
  end

  # POST /imports
  # POST /imports.json
  def create
    @import = Import.new(import_params)
    respond_to do |format|
      if @import.save
         @import.process_file(@import.id)

        format.html { redirect_to imports_path, notice: 'Import was successfully created.' }
        format.json { render action: 'show', status: :created, location: @import }
      else
        format.html { render action: 'new' }
        format.json { render json: @import.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imports/1
  # PATCH/PUT /imports/1.json
  def update
    respond_to do |format|
      if @import.update(import_params)
        format.html { redirect_to @import, notice: 'Import was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @import.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imports/1
  # DELETE /imports/1.json
  def destroy
    @import.destroy
    respond_to do |format|
      format.html { redirect_to imports_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_import
      @import = Import.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def import_params
      params.require(:import).permit(:record_count, :total_gross_revenue, :completed, :file)
      # params.fetch(:import, {}).permit(:file)
    end
end
