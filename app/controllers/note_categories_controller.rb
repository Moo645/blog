class NoteCategoriesController < ApplicationController
  before_action :set_note_category, only: %i[edit update destroy]

  def index
    @note_categories = NoteCategory.includes(:notebook).all.order(:notebook_id)
  end

  def new
    @note_category = NoteCategory.new
    @notebooks = Notebook.all
  end

  def create
    @note_category = NoteCategory.new(note_category_params)
    respond_to do |format|
      if @note_category.save
        format.turbo_stream { append_note_category }
        format.html { redirect_to note_categories_path }
      else
        @notebooks = Notebook.all
        format.html { render :new }
      end
    end
  end

  def show
    @note_category = NoteCategory.includes(:notes).find(params[:id])
  end

  def edit
    @notebooks = Notebook.all
  end

  def update
    respond_to do |format|
      if @note_category.update(note_category_params)
        format.turbo_stream { append_note_category }
      else
        @notebooks = Notebook.all
        format.html { render :edit }
      end
    end
  end

  def destroy
    @note_category.destroy
    redirect_to note_categories_path, status: :see_other, notice: "#{@note_category.name} 刪除成功！"
  end

  private

  def note_category_params
    params.require(:note_category).permit(:name, :notebook_id)
  end

  def set_note_category
    @note_category = NoteCategory.find(params[:id])
  end

  def append_note_category
    render turbo_stream: turbo_stream.append('note_categories', partial: 'note_categories/note_category',
                                                                locals: { note_category: @note_category })
  end
end
