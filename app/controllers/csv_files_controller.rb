class CsvFilesController < ApplicationController
  before_action :set_csv_file, only: [:show, :destroy]

  def index
    @csv_files = CsvFile.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @csv_file = CsvFile.new
  end

  def edit
  end

  def create
    @csv_file = CsvFile.new(cvs_params)
    puts cvs_params.inspect.to_yaml
    respond_to do |format|
      @csv_file.user_id = current_user.id
      if @csv_file.save
        format.html { redirect_to csv_files_path, notice: 'CSV was successfully created.' }
        format.json { render :show, status: :created, location: @csv_file }
      else
        format.html { render :new }
        format.json { render json: @csv_file.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @csv_file.destroy
    respond_to do |format|
      format.html { redirect_to csv_files_url, notice: 'File was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_csv_file
    @csv_file = CsvFile.find(params[:id])
  end

  def cvs_params
    params.require(:csv_file).permit(:file)
  end

end
