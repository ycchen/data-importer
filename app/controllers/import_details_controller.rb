class ImportDetailsController < ApplicationController
  before_action :set_import_detail, only: [:show, :edit, :update, :destroy]

  # GET /import_details
  # GET /import_details.json
  def index
    if params[:import_id]
      @import_details = ImportDetail.where(import_id: params[:import_id])
    else
      @import_details = ImportDetail.all
    end
  end

  # GET /import_details/1
  # GET /import_details/1.json
  def show
  end

  # GET /import_details/new
  def new
    @import_detail = ImportDetail.new
  end

  # GET /import_details/1/edit
  def edit
  end

  # POST /import_details
  # POST /import_details.json
  def create
    @import_detail = ImportDetail.new(import_detail_params)

    respond_to do |format|
      if @import_detail.save
        format.html { redirect_to @import_detail, notice: 'Import detail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @import_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @import_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /import_details/1
  # PATCH/PUT /import_details/1.json
  def update
    respond_to do |format|
      if @import_detail.update(import_detail_params)
        format.html { redirect_to @import_detail, notice: 'Import detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @import_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /import_details/1
  # DELETE /import_details/1.json
  def destroy
    @import_detail.destroy
    respond_to do |format|
      format.html { redirect_to import_details_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_import_detail
      @import_detail = ImportDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def import_detail_params
      params.require(:import_detail).permit(:purchaser_name, :merchant_name, :merchant_address, :item_description, :item_price, :purchase_count, :import_id)
    end
end
