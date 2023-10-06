class NotebooksController < ApplicationController
  before_action :set_notebook, only: %i[destroy edit update]

  def index
    @notebooks = Notebook.includes(:note_categories).all
  end

  def new
    @notebook = Notebook.new
  end

  def create
    @notebook = Notebook.new(notebook_params)
    respond_to do |format|
      if @notebook.save
        format.turbo_stream { append_notebook }
        format.html { redirect_to notebooks_path, notice: "Notebook: \"#{@notebook.name}\" 創建成功！" }
      else
        format.html { render :new }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @notebook.update(notebook_params)
        format.turbo_stream { append_notebook }
        format.html { redirect_to notebooks_path, notice: "Notebook: \"#{@notebook.name}\" 創建成功！" }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @notebook.destroy
    redirect_to notebooks_path, notice: "#{@notebook.name} 刪除成功！"
  end

  private

  def notebook_params
    params.require(:notebook).permit(:name)
  end

  def set_notebook
    @notebook = Notebook.find(params[:id])
  end

  def append_notebook
    render turbo_stream: turbo_stream.append('notebooks', partial: 'notebooks/notebook', locals: { notebook: @notebook })
  end
end
